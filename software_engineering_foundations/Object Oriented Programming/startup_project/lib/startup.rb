# frozen_string_literal: true

require 'employee'

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    !@salaries[title].nil?
  end

  def >(startup)
    @funding > startup.funding
  end

  def hire(employee_name, title)
    if valid_title?(title)
      new_employee = Employee.new employee_name, title
      @employees << new_employee
    else
      raise 'Invalid title'
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    amount_to_pay = @salaries[employee.title]
    if @funding > amount_to_pay
      employee.pay amount_to_pay
      @funding -= amount_to_pay
    else
      raise 'Insufficient funds to pay employee'
    end
  end

  def payday
    @employees.each { |employee| pay_employee(employee) }
  end
end
