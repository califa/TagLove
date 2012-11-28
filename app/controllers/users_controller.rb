class UsersController < ApplicationController
  layout "gatherye"

  def show
  	@user = User.find(params[:id])
  end
end
