# frozen_string_literal: true

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
          # Command logic goes here ...
          output.puts "Gathering salaries for department #{@department} for fiscal year #{@year}"
          output.puts "OK"
        end
      end
    end
  end
end
