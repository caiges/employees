module Employeesdb
  module DB

    class Salaries
      def initialize(client)
        @client = client
      end

      def amount_paid_per_quarter_by_department(fiscal_year)

        datefmt = "%Y-%m-%d"

        query = <<-TERMINATOR
          select dept_name, sum(q1) as q1, sum(q2) as q2, sum(q3) as q3, sum(q4) as q4
          from (
            select d.dept_name, (datediff(least(s.to_date, '#{fiscal_year.first.end.strftime(datefmt)}'), greatest(s.from_date, '#{fiscal_year.first.begin.strftime(datefmt)}'))/365)*s.salary as q1, 0 as q2, 0 as q3, 0 as q4
            from dept_emp de, salaries s, departments d
            where de.emp_no = s.emp_no
            and de.dept_no = d.dept_no
            and datediff(least(s.to_date, '#{fiscal_year.first.end.strftime(datefmt)}'), greatest(s.from_date, '#{fiscal_year.first.begin.strftime(datefmt)}')) > 0
            and datediff(least(s.to_date, de.to_date), greatest(s.from_date, de.from_date)) > 0
            
            UNION
            
            select d.dept_name, 0 as q1, (datediff(least(s.to_date, '#{fiscal_year.second.end.strftime(datefmt)}'), greatest(s.from_date, '#{fiscal_year.second.begin.strftime(datefmt)}'))/365)*s.salary as q2, 0 as q3, 0 as q4
            from dept_emp de, salaries s, departments d
            where de.emp_no = s.emp_no
            and de.dept_no = d.dept_no
            and	datediff(least(s.to_date, '#{fiscal_year.second.end.strftime(datefmt)}'), greatest(s.from_date, '#{fiscal_year.second.begin.strftime(datefmt)}')) > 0
            and datediff(least(s.to_date, de.to_date), greatest(s.from_date, de.from_date)) > 0
            
            UNION
            
            select d.dept_name, 0 as q1, 0 as q3, (datediff(least(s.to_date, '#{fiscal_year.third.end.strftime(datefmt)}'), greatest(s.from_date, '#{fiscal_year.third.begin.strftime(datefmt)}'))/365)*s.salary as q3, 0 as q4
            from dept_emp de, salaries s, departments d
            where de.emp_no = s.emp_no
            and de.dept_no = d.dept_no
            and	datediff(least(s.to_date, '#{fiscal_year.third.end.strftime(datefmt)}'), greatest(s.from_date, '#{fiscal_year.third.begin.strftime(datefmt)}')) > 0
            and datediff(least(s.to_date, de.to_date), greatest(s.from_date, de.from_date)) > 0
            
            UNION
            
            select d.dept_name, 0 as q1, 0 as q2, 0 as q3, (datediff(least(s.to_date, '#{fiscal_year.fourth.end.strftime(datefmt)}'), greatest(s.from_date, '#{fiscal_year.fourth.begin.strftime(datefmt)}'))/365)*s.salary as q4
            from dept_emp de, salaries s, departments d
            where de.emp_no = s.emp_no
            and de.dept_no = d.dept_no
            and	datediff(least(s.to_date, '#{fiscal_year.fourth.end.strftime(datefmt)}'), greatest(s.from_date, '#{fiscal_year.fourth.begin.strftime(datefmt)}')) > 0
            and datediff(least(s.to_date, de.to_date), greatest(s.from_date, de.from_date)) > 0
          ) as quarter_salaries
          group by dept_name
        TERMINATOR

        @client.query(query)
      end
    end

  end
end
