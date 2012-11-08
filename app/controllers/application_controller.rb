class ApplicationController < ActionController::Base
  protect_from_forgery



  	def create_session(email,password)

	    if user = User.authenticate(email,password)

	    	reset_session
	    	session[:user_id] = user.id

	    	user.logged_in = "true"
	    	user.last_access = Time.now
	    	user.last_access_time = Time.now
			user.save

	    end

	end


	def check_session

		if session[:user_id]

			user = User.find(session[:user_id])
			time_out = WebsiteSetting.find(1).session_time_out

			time_difference = Time.now.to_i - user.last_access_time.to_i

			if time_difference > (time_out * 60) && user.logged_in == "true" 
				redirect_to "/logout"
			end

			user.last_access = Time.now
			user.last_access_time = Time.now
			user.save

		end

	end

  
  	def authenticate_user

		if session[:user_id]
			#do nothing
		else
			render :text => "You do not have permission to view the page your have requested. [error :: apc1001]"
		end

	end



  	def authenticate_admin

  		if !session[:user_id].nil?


	  		user = User.find(session[:user_id])

	  		if user.permission == "super_admin"
				#do nothing			
			else
				render :text => "You do not have permission to view the page your have requested. [error :: apc1002]"
			end

		else
			render :text => "You do not have permission to view the page your have requested. [error :: apc1003]"
		end

	end



end
