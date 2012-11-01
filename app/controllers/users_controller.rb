class UsersController < ApplicationController

before_filter :authenticate_admin, :only => [:index, :edit, :destroy]


  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end


# NEW
  def new
    @user = User.new

    page = Page.where(:url => "register_new_user").first

    respond_to do |format|
      format.html { render :layout => page.page_layout }
      format.json { render json: @user }
    end
  end



  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end



#CREATE
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save


        create_session(@user.email, @user.password)

        format.html { redirect_to "/test1/test2/this_is_a_test", notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new", :layout => "layout_2" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end


#**********Custom Methods






end

