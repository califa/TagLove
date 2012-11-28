class StreamController < ApplicationController
  layout 'stream'

  def home
  	@image = current_user.uploads.build
  	@tags = Tag.all
  end
end
