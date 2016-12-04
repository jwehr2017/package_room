class ResidentsController < ApplicationController
  before_action :current_user_must_be_resident_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_resident_user
    resident = Resident.find(params[:id])

    unless current_user == resident.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Resident.ransack(params[:q])
    @residents = @q.result(:distinct => true).includes(:apartment, :packages, :user).page(params[:page]).per(10)

    render("residents/index.html.erb")
  end

  def show
    @package = Package.new
    @resident = Resident.find(params[:id])

    render("residents/show.html.erb")
  end

  def new
    @resident = Resident.new

    render("residents/new.html.erb")
  end

  def create
    @resident = Resident.new

    @resident.apartment_id = params[:apartment_id]
    @resident.phone_number = params[:phone_number]
    @resident.email_address = params[:email_address]
    @resident.user_id = params[:user_id]
    @resident.name = params[:name]

    save_status = @resident.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/residents/new", "/create_resident"
        redirect_to("/residents")
      else
        redirect_back(:fallback_location => "/", :notice => "Resident created successfully.")
      end
    else
      render("residents/new.html.erb")
    end
  end

  def edit
    @resident = Resident.find(params[:id])

    render("residents/edit.html.erb")
  end

  def update
    @resident = Resident.find(params[:id])

    @resident.apartment_id = params[:apartment_id]
    @resident.phone_number = params[:phone_number]
    @resident.email_address = params[:email_address]
    @resident.user_id = params[:user_id]
    @resident.name = params[:name]

    save_status = @resident.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/residents/#{@resident.id}/edit", "/update_resident"
        redirect_to("/residents/#{@resident.id}", :notice => "Resident updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Resident updated successfully.")
      end
    else
      render("residents/edit.html.erb")
    end
  end

  def destroy
    @resident = Resident.find(params[:id])

    @resident.destroy

    if URI(request.referer).path == "/residents/#{@resident.id}"
      redirect_to("/", :notice => "Resident deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Resident deleted.")
    end
  end
end
