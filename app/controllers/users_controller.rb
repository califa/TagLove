class UsersController < ApplicationController
  layout "stream"

  def show
  	@user = current_user
  	@pageuser = User.find_by_username(params[:username])
  	@tags = current_user.tags
  	@userimages = Image.desc.where('user_id == ' + @pageuser.id.to_s)
  end

end
