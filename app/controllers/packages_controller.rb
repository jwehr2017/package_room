class PackagesController < ApplicationController
  def index
    @packages = Package.all

    render("packages/index.html.erb")
  end

  def show
    @package = Package.find(params[:id])

    render("packages/show.html.erb")
  end

  def new
    @package = Package.new

    render("packages/new.html.erb")
  end

  def create
    @package = Package.new

    @package.location_id = params[:location_id]
    @package.resident_id = params[:resident_id]
    @package.contact_time = params[:contact_time]
    @package.contact_type = params[:contact_type]
    @package.employee_id = params[:employee_id]

    save_status = @package.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/packages/new", "/create_package"
        redirect_to("/packages")
      else
        redirect_back(:fallback_location => "/", :notice => "Package created successfully.")
      end
    else
      render("packages/new.html.erb")
    end
  end

  def edit
    @package = Package.find(params[:id])

    render("packages/edit.html.erb")
  end

  def update
    @package = Package.find(params[:id])

    @package.location_id = params[:location_id]
    @package.resident_id = params[:resident_id]
    @package.contact_time = params[:contact_time]
    @package.contact_type = params[:contact_type]
    @package.employee_id = params[:employee_id]

    save_status = @package.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/packages/#{@package.id}/edit", "/update_package"
        redirect_to("/packages/#{@package.id}", :notice => "Package updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Package updated successfully.")
      end
    else
      render("packages/edit.html.erb")
    end
  end

  def destroy
    @package = Package.find(params[:id])

    @package.destroy

    if URI(request.referer).path == "/packages/#{@package.id}"
      redirect_to("/", :notice => "Package deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Package deleted.")
    end
  end
end
