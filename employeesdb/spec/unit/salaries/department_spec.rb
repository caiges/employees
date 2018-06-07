require 'employeesdb/commands/salaries/department'

RSpec.describe Employeesdb::Commands::Salaries::Department do
  skip "executes `salaries department` command successfully" do
    output = StringIO.new
    department = nil
    year = nil
    options = {}
    command = Employeesdb::Commands::Salaries::Department.new(department, year, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
