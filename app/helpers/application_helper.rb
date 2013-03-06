module ApplicationHelper


	def get_title_helper

		@title_header = "<title>#{request.host_with_port}</title>".html_safe

		if !@title.nil? || @title != ""
			@title_header = "<title>#{@title}</title>".html_safe			
		end

	end

	def get_description_helper

		@meta_description = ""

		if !@description.nil? || @description != ""
			@meta_description = "<meta name='description' content='#{@description}' />".html_safe
		end

	end

	def get_banner_helper
		@banner_is = ""

		if @banner != ""
			@banner_is = image_tag (@banner) 
		end

	end


	def get_canonical_helper

		@meta_canonical = ""

   		uri = request.fullpath.to_s
   		uri_length = uri.length
   		uri = uri[1..uri_length]
   		uri_length = uri.length

   		if !@page.nil?

	   		if @page.url.to_s != uri || @page.url.length != uri.length

				if !@canonical.nil? || @canonical != ""
					@meta_description = "<link rel='canonical' href='#{request.host_with_port}/#{@canonical}'/>".html_safe
				end

			end
		end

	end




	def get_logged_in_as_helper

		@logged_in_as = nil

		if session[:user_id]
			user = User.find(session[:user_id])
			@logged_in_as = "<span class='font10 fontWhite'>logged in as #{user.email}</span>"
		end

	end


	def get_admin_is_helper

		user = User.find(session[:user_id])

		if user.permission == "super_admin"
			"true"
		else
			"false"
		end

	end



end
