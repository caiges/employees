# frozen_string_literal: true

require 'thor'

module Employeesdb
  module Commands
    class Salaries < Thor

      namespace :salaries

      desc 'department DEPARTMENT YEAR', 'Get department salary spend per quarter for a fiscal year'
      method_option :help, aliases: '-h', type: :boolean,
                           desc: 'Display usage information'
      def department(department, year)
        if options[:help]
          invoke :help, ['department']
        else
          require_relative 'salaries/department'
          Employeesdb::Commands::Salaries::Department.new(department, year, options).execute
        end
      end
    end
  end
end
