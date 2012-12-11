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
			@image = current_user.uploads.build(params[:image])
			@tag = @image.tag

			if (@image.save)
				current_user.edit_rank(@tag, 10)
				respond_with(@image)
			end
		end

		def like
			# This is also unlike
			user_images = current_user.images
			image = Image.find(params[:id])
			tag = image.tag
			uploader = image.uploader
			old_rank = current_user.find_rank(tag).first

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

		    new_rank = current_user.find_rank(tag).first
		    points = new_rank.points
		    percent = new_rank.points_to_percent.to_s
		    tag_s = tag.id.to_s
		    tagtitle = tag.title

		    new_bronze_flag = (new_rank.points >= BRONZE_POINTS && old_rank.points < BRONZE_POINTS || new_rank.points < BRONZE_POINTS && old_rank.points >= BRONZE_POINTS )


		    respond_with do |format| 
		    	format.json {
		    		render :json => { width: percent, tag: tag_s, tagtitle: tagtitle, points: points, rank: new_rank.points_to_rank, new_bronze_flag: new_bronze_flag }
		    	}
		    end
	    end
end
