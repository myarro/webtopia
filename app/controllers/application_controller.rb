class ApplicationController < ActionController::Base
  protect_from_forgery



  	def create_session(email,password)

	    if user = User.authenticate(email,password)

	    	reset_session
	    	session[:user_id] = user.id

	    	user.last_access_time = Time.now
			user.save

	    end

	end


	def check_session

		if session[:user_id]
			user = User.find(session[:user_id])

#			time1 = Time.now.to_i
#			time2 = user.last_access_time.to_i



			time_difference = Time.now.to_i - user.last_access_time.to_i

			if time_difference > 60 #and the user is logged in. Otherwise do nothing. Flag for login needs to be added.
				redirect_to "/logout"
			end

			user.last_access_time = Time.now
			user.save

		else
			puts "********There is no session"
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
