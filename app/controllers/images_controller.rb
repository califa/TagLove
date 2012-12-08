class ImagesController < ApplicationController
	layout 'images'
	respond_to :html, :json
		def index
			#@image = Image.find(params[:id])
			#respond_with(@image)
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

		def like
			# This is also unlike
			user_images = current_user.images
			image = Image.find(params[:id])
			tag = image.tag
			uploader = image.uploader

			if (user_images.include?(image)) #if user already likes image

				#delete
				user_images.delete(image)
				#set points
				current_user.edit_rank(tag, -1) if (uploader != current_user)


			else #if user doesn't already have image liked

				#add images
 		  		user_images << image
 		  		#set points		  		
		  		if (uploader != current_user)
			  		uploader.edit_rank(tag, 50)
			  		current_user.edit_rank(tag, 1)
			  	end
		    end

		    rank = current_user.find_rank(tag).first
		    points = rank.points
		    percent = rank.points_to_percent.to_s
		    tag_s = tag.id.to_s
		    tagtitle = tag.title

		    respond_with do |format| 
		    	format.json {
		    		render :json => { width: percent, tag: tag_s, tagtitle: tagtitle, points: points, rank: rank.points_to_rank }
		    	}
		    end
	    end
end
