class SessionsController < ApplicationController


	def create
		create_session(params[:email],params[:password])

		if session[:user_id]
			respond_to do |format|
		        format.html { redirect_to "/test1/test2/this_is_a_test"}
	    	  end
	    else
	      	render :text => "Not a valid user. [error :: sc1002]"
	    end
	    
	end

  def destroy
  		reset_session
  		redirect_to "/login", :notice => "You are logged out"
  	end



end
