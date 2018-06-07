require 'date'

module Employeesdb
  module Date
    module Finance
      class FiscalYear
        attr_accessor :first, :second, :third, :fourth
        def initialize(year)
          start = ::Date.new year, 10, 1
          @first = Range.new(start, start.next_month(3).prev_day)
          @second = Range.new(@first.end.next_day, @first.end.next_month(3))
          @third = Range.new(@second.end.next_day, @second.end.next_month(3))
          @fourth = Range.new(@third.end.next_day, @third.end.next_month(3))
        end

        def to_s
          "First: #{@first}\nSecond: #{@second}\nThird: #{@third}\nFourth: #{@fourth}"
        end
      end
    end
  end
end
