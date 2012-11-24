class ApplicationController < ActionController::Base
  protect_from_forgery

  # redirect_to root_path if !(user_signed_in?) 
end
