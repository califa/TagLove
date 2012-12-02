class ImagesController < ApplicationController
	layout 'images'
	respond_to :html, :json, :post
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
			@tag = @image.tag

			current_user.edit_rank(@tag, 10)

			respond_with(@image)
		end

		def collect
			image = Image.find(params[:id])
	  		current_user.images << image
	  		
	  		tag = image.tag
	  		uploader = image.uploader
	  		if uploader != current_user do
		  		uploader.edit_rank(tag, 50)
		  		current_user.edit_rank(tag, 1)
		  	end
	    end
end
