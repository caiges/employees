# frozen_string_literal: true

require 'thor'

module Employeesdb
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'employeesdb version'
    def version
      require_relative 'version'
      puts "v#{Employeesdb::VERSION}"
    end
    map %w(--version -v) => :version

    require_relative 'commands/salaries'
    register Employeesdb::Commands::Salaries, 'salaries', 'salaries [SUBCOMMAND]', 'Get department salary spend per quarter for a fiscal year'
  end
end
