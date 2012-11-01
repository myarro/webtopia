module ApplicationHelper


	def get_title_helper

		@title_header = "<title>#{request.host_with_port}</title>"

		if !@title.nil? || @title != ""
			@title_header = "<title>#{@title}</title>"			
		end

	end

	def get_description_helper

		@meta_description = ""

		if !@description.nil? || @description != ""
			@meta_description = "<meta name='description' content='#{@description}' />"
		end

	end

	def get_logged_in_as

		@logged_in_as = nil

		if session[:user_id]
			user = User.find(session[:user_id])
			@logged_in_as = "<span class='font10 fontWhite'>logged in as #{user.email}</span>"
		end

	end




end
