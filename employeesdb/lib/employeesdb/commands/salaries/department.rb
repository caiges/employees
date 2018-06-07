# frozen_string_literal: true

require 'mysql2'
require 'tty-table'

require_relative '../../command'
require_relative '../../db/department'
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
          # Create a quarterly spend report
          # Output table of results

          # Get departments
          department_db = Employeesdb::DB::Department.new @client

          results = department_db.assignments_by_fiscal_year @year
          rows = []
          results.each as: :array do | row |
            rows << row
          end

          table = TTY::Table.new results.fields, rows

          fiscal_year = Employeesdb::Date::Finance::FiscalYear.new(@year.to_i)
          puts fiscal_year

          puts table
        end
      end
    end
  end
end
