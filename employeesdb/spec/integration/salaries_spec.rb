RSpec.describe "`employeesdb salaries` command", type: :cli do
  it "executes `employeesdb help salaries` command successfully" do
    output = `employeesdb help salaries`
    expected_output = <<-OUT
Commands:
    OUT

    expect(output).to eq(expected_output)
  end
end
