class ImagesController < ApplicationController
	layout 'images'
	respond_to :html, :json
		def index
			@image = Image.find(params[:id])
			respond_with(@image)
			# redirect_to('/home')
		end

		def show
			@image = Image.find(params[:id])
			respond_with(@image)
			# redirect_to('/home')

		end

		def create
			@image = current_user.uploads.create(params[:image])
			@tags =  Tag.all # change to current_user.tags
			#render :text => "OK"
			respond_with(@image)
		end
end
