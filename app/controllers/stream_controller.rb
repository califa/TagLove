class StreamController < ApplicationController
  layout 'stream'

  def home
  	@image = current_user.uploads.build
  	@tags = Tag.all
  	@allimages = Image.desc.all
  	@id = current_user.id
  end
end
