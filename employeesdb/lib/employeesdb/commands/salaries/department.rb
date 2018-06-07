# frozen_string_literal: true

require 'mysql2'
require 'tty-table'

require_relative '../../command'


module Employeesdb
  module Commands
    class Salaries
      class Department < Employeesdb::Command
        def initialize(department, year, options)
          @department = department
          @year = year
          @options = options
        end

        def execute(input: $stdin, output: $stdout)

          # Connect to db
          client = Mysql2::Client.new(:host => ENV['EMP_HOST'], :database => ENV['EMP_DATABASE'], :username => ENV['EMP_USERNAME'], :password => ENV['EMP_PASSWORD'])

          results = client.query("SELECT * FROM departments")
          rows = []
          results.each as: :array do | row |
            rows << row
          end

          table = TTY::Table.new results.fields, rows

          puts table
        end
      end
    end
  end
end
