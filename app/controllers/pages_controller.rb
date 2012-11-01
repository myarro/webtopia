class PagesController < ApplicationController


  before_filter :authenticate_admin, :only => [:index, :show, :new, :create, :destroy]
  before_filter :check_session
#  before_filter :authenticate_user, :only => [:section_sub_page]


  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :ok }
    end
  end


  def test(what)

    return "#{what} is this"

  end



#SITEMAP_PAGE
  def sitemap_page

    #might want to switch the request.host_with_port to a config db in the db call. Don't know how reliable request.host_with_port is


    @sitemap = Page.find_sitemap (request.host_with_port)

    render :xml => @sitemap

  end


#LOGIN_page
  def login_page

    respond_to do |format|
      format.html {render :layout => "layout_1"}
    end

  end



#SECTION_SUB_PAGE
  def section_sub_page

    if (params[:section1] == "scr" && session[:user_id]) || params[:section1] != "scr"

      (@page, @content1, @content2, @content3, @content4) = Page.find_page(params[:section1],params[:section2],params[:section3],params[:section4],params[:page_name])
      @title = @page.title
      @description = @page.description

    else

      @page = nil

    end

    if !@page.nil?
      respond_to do |format|
       format.html {render :layout => @page.page_layout}
     end
   else
    render :text => "You do not have permission to view the page your have requested. [error :: pc1001]"
   end

  end


end
