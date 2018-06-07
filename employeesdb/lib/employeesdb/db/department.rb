module Employeesdb
  module DB

    class Department
      def initialize(client)
        @client = client
      end

      def assignments_by_fiscal_year(year)
        @client.query('select * from dept_emp UNION select * from dept_manager limit 50')
      end
    end

  end
end
