# frozen_string_literal: true

require 'thor'

module Employeesdb
  module Commands
    class Salaries < Thor

      namespace :salaries

      desc 'department DEPARTMENT YEAR', 'Get quarterly spend'
      method_option :help, aliases: '-h', type: :boolean, desc: 'Display usage information'
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
