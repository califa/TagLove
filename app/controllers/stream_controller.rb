class StreamController < ApplicationController
  layout 'stream'

  def home
  	@image = current_user.uploads.build
  	@tags = current_user.tags
  	@user = current_user
  	@allimages = Image.desc.all
  	@id = current_user.id
  end


end
