class EmployeesController < ApplicationController
  def index
    @employees = Unirest.get("http://localhost:3000/api/v1/employees.json").body
  end

  def new
    
  end

  def create
    @employee = Unirest.post(
              "http://localhost:3000/api/v1/employees.json",
              headers: { "Accept" => "application/json" }, 
              parameters: { 
                  first_name: params[:first_name],
                  last_name: params[:last_name],
                  ssn: params[:ssn],
                  email: params[:email]
               }).body

    render :show
  end

  def show
    @employee = Unirest.get("http://localhost:3000/api/v1/employees/#{params[:id]}.json").body
  end
end
