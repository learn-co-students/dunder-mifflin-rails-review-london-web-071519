class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def show
        @employee = Employee.find(params[:id])
    end

    def edit
        @employee = Employee.find(params[:id])
    end

    def create
        @employee = Employee.create(employee_params)
        byebug
        redirect_to employee_path(@employee)
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)
        redirect_to employee_path(@employee)
    end

    def destroy
        Employee.find(params[:id]).destroy
        redirect_to employees_path
    end

    private

    def employee_params
        params.require(:employee).permit(:dog_id, :first_name, :last_name, :alias, :title, :office, :img_url)
    end
end