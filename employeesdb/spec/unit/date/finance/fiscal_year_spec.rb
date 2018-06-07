require 'employeesdb/date/finance'

RSpec.describe Employeesdb::Date::Finance::FiscalYear do
  it 'should start and end at the right dates' do
    fiscal_year = Employeesdb::Date::Finance::FiscalYear.new(2002)

    expect(fiscal_year.first === Date.new(2002, 10, 1)).to be true
  end

  it 'should raise an argument error if no year is provided' do
    expect {
      Employeesdb::Date::Finance::FiscalYear.new()
    }.to raise_error(ArgumentError)
  end
end
