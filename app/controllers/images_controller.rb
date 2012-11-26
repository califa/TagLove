class ImagesController < ApplicationController

		def index
			@images = Image.all
			respond_with({:images => @images}.as_json)
		end

		def show
			@image = Image.find(params[:id])
			respond_with(@image)
		end

		def create
			@image = Image.create(params[:image])
			@tags = Tag.all
			respond_with(@image)
		end
end
