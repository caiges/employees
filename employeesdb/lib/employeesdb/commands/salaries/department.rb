# frozen_string_literal: true

require 'mysql2'
require 'tty-table'

require_relative '../../command'
require_relative '../../db/salaries'
require_relative '../../date/finance'

module Employeesdb
  module Commands
    class Salaries
      class Department < Employeesdb::Command
        def initialize(department, year, options)
          @department = department
          @year = year
          @options = options
          @client = Mysql2::Client.new(
            host: ENV['EMP_HOST'],
            database: ENV['EMP_DATABASE'],
            username: ENV['EMP_USERNAME'],
            password: ENV['EMP_PASSWORD']
          )
        end

        def execute(input: $stdin, output: $stdout)
          # Get departments
          salaries = Employeesdb::DB::Salaries.new @client

          fiscal_year = Employeesdb::Date::Finance::FiscalYear.new @year.to_i
          amount_paid_per_quarter_by_department = salaries.amount_paid_per_quarter_by_department fiscal_year
          
          rows = []
          currency_format = "$%.2f"
          amount_paid_per_quarter_by_department.each as: :array do | row |
            rows << [row[0], currency_format % row[1].round(2), currency_format % row[2].round(2), currency_format % row[3].round(2), currency_format % row[4].round(2)]
          end

          table = TTY::Table.new amount_paid_per_quarter_by_department.fields, rows

          puts table
        end
      end
    end
  end
end
