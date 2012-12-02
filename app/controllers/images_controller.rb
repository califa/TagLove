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
			@tag = @image.tag

			current_user.add_to_rank(@tag.id, 10)

			respond_with(@image)
		end

		def collect
	  		current_user.images << collected_image
	    end
end
