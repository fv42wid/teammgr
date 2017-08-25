class EmployeesController < ApplicationController

  def index
    @employees = Employee.includes(:assignments)
  end

  def show
    @employees = Employee.all
  end
end