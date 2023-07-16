class EmployeesController < ApplicationController
    def employee_details
        @employees = Employee.joins("inner join departments on employees.dept_id = departments.id").select("first_name","designation","departments.dept_name").all
    end
    def new
        @departments = Department.all
    end
    def create
        @employee = Employee.new(:first_name => params[:first_name], :last_name => params[:last_name], :dept_id => params[:dept_id], :email_address => params[:email_address], :designation => params[:designation])
        if @employee.save
            redirect_to :action => 'employee_details'
        else
          render :new, status: :unprocessable_entity
        end
    end
end
