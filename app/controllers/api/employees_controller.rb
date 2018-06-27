class Api::EmployeesController < ApplicationController
  def create
    employee = Employee.new(employee_params)
    if employee.save!
       json_response({employee: employee.as_json(:except => [:created_at, :updated_at])})
    end
  end

  def show
    employee = Employee.eager_load(:superior).find(params[:id])
    json_response({employees: employee.hierarchy.as_json(:except => [:created_at, :updated_at])})
  end

  def top_employees
    employees = Employee.top_employees
    json_response({employees: employees.as_json(:except => [:created_at, :updated_at])})
  end

  def destroy
    employee = Employee.find(params[:id])
    if employee.destroy
      json_response({message: "Employee deleted"})
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :salary, :rating, :role, :superior_id)
  end
end