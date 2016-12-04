Rails.application.routes.draw do
  # Routes for the Package resource:
  # CREATE
  get "/packages/new", :controller => "packages", :action => "new"
  post "/create_package", :controller => "packages", :action => "create"

  # READ
  get "/packages", :controller => "packages", :action => "index"
  get "/packages/:id", :controller => "packages", :action => "show"

  # UPDATE
  get "/packages/:id/edit", :controller => "packages", :action => "edit"
  post "/update_package/:id", :controller => "packages", :action => "update"

  # DELETE
  get "/delete_package/:id", :controller => "packages", :action => "destroy"
  #------------------------------

  # Routes for the Location resource:
  # CREATE
  get "/locations/new", :controller => "locations", :action => "new"
  post "/create_location", :controller => "locations", :action => "create"

  # READ
  get "/locations", :controller => "locations", :action => "index"
  get "/locations/:id", :controller => "locations", :action => "show"

  # UPDATE
  get "/locations/:id/edit", :controller => "locations", :action => "edit"
  post "/update_location/:id", :controller => "locations", :action => "update"

  # DELETE
  get "/delete_location/:id", :controller => "locations", :action => "destroy"
  #------------------------------

  # Routes for the Resident resource:
  # CREATE
  get "/residents/new", :controller => "residents", :action => "new"
  post "/create_resident", :controller => "residents", :action => "create"

  # READ
  get "/residents", :controller => "residents", :action => "index"
  get "/residents/:id", :controller => "residents", :action => "show"

  # UPDATE
  get "/residents/:id/edit", :controller => "residents", :action => "edit"
  post "/update_resident/:id", :controller => "residents", :action => "update"

  # DELETE
  get "/delete_resident/:id", :controller => "residents", :action => "destroy"
  #------------------------------

  # Routes for the Apartment resource:
  # CREATE
  get "/apartments/new", :controller => "apartments", :action => "new"
  post "/create_apartment", :controller => "apartments", :action => "create"

  # READ
  get "/apartments", :controller => "apartments", :action => "index"
  get "/apartments/:id", :controller => "apartments", :action => "show"

  # UPDATE
  get "/apartments/:id/edit", :controller => "apartments", :action => "edit"
  post "/update_apartment/:id", :controller => "apartments", :action => "update"

  # DELETE
  get "/delete_apartment/:id", :controller => "apartments", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
