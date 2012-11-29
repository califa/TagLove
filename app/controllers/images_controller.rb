class ImagesController < ApplicationController
	layout 'images'
	respond_to :html, :json
		def index
			@images = Image.all
			respond_with({:images => @images}.as_json)
		end

		def show
			@image = Image.find(params[:id])
			respond_with(@image)
			# redirect_to('/home')

		end

		def create
			@image = Image.create(params[:image], :uploader_id => current_user.id)
			@tags =  Tag.all # change to current_user.tags
			#render :text => "OK"
			respond_with(@image)
		end
end
