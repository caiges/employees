module Employeesdb
  module DB

    class Department
      def initialize(client)
        @client = client
      end

      def assignments_by_fiscal_year(year)
        @client.query("SELECT * FROM departments")
      end
    end

  end
end
