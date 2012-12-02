module StreamHelper

	def collect_image(image) 

		current_user.images << image
		
	end

end
