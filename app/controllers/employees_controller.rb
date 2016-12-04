class EmployeesController < ApplicationController
  def index
    @employees = Employee.page(params[:page]).per(10)

    render("employees/index.html.erb")
  end

  def show
    @package = Package.new
    @employee = Employee.find(params[:id])

    render("employees/show.html.erb")
  end

  def new
    @employee = Employee.new

    render("employees/new.html.erb")
  end

  def create
    @employee = Employee.new

    @employee.user_id = params[:user_id]

    save_status = @employee.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/employees/new", "/create_employee"
        redirect_to("/employees")
      else
        redirect_back(:fallback_location => "/", :notice => "Employee created successfully.")
      end
    else
      render("employees/new.html.erb")
    end
  end

  def edit
    @employee = Employee.find(params[:id])

    render("employees/edit.html.erb")
  end

  def update
    @employee = Employee.find(params[:id])

    @employee.user_id = params[:user_id]

    save_status = @employee.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/employees/#{@employee.id}/edit", "/update_employee"
        redirect_to("/employees/#{@employee.id}", :notice => "Employee updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Employee updated successfully.")
      end
    else
      render("employees/edit.html.erb")
    end
  end

  def destroy
    @employee = Employee.find(params[:id])

    @employee.destroy

    if URI(request.referer).path == "/employees/#{@employee.id}"
      redirect_to("/", :notice => "Employee deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Employee deleted.")
    end
  end
end
