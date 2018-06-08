# frozen_string_literal: true

require 'thor'

module Employeesdb
  module Commands
    class Salaries < Thor

      namespace :salaries

      desc 'department YEAR', 'Get quarterly spend'
      method_option :help, aliases: '-h', type: :boolean, desc: 'Display usage information'
      def department(year)
        if options[:help]
          invoke :help
        else
          require_relative 'salaries/department'
          Employeesdb::Commands::Salaries::Department.new(year, options).execute
        end
      end
    end
  end
end
