class HomeController < ApplicationController
  layout "outside_forms"
  def landing
    if signed_in?.blank?
    	redirect_to new_user_registration_path
    else
        redirect_to '/home'
    end
  end

  def index
  end

end
