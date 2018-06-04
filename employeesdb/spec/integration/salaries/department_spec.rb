RSpec.describe "`employeesdb salaries department` command", type: :cli do
  it "executes `employeesdb salaries help department` command successfully" do
    output = `employeesdb salaries help department`
    expected_output = <<-OUT
Usage:
  employeesdb department DEPARTMENT YEAR

Options:
  -h, [--help], [--no-help]  # Display usage information

Get department salary spend per quarter for a fiscal year
    OUT

    expect(output).to eq(expected_output)
  end
end
