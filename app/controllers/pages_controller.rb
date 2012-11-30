class PagesController < ApplicationController


  before_filter :authenticate_admin, :only => [:index, :show, :new, :create, :destroy, :get_admin]
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


#*******************___________________Custom

#HOME_PAGE
  def home_page

    @home = Page.find(WebsiteSetting.find(1).home_page)

    get_page_content(@home.section1,@home.section2,@home.section3,@home.section4,@home.page_name)

    if !@page.nil?
      respond_to do |format|
       format.html {render :layout => @page.page_layout, :template => "/pages/section_sub_page"}
      end
    else
      render :text => "You must create and assign your home page in the Website Settings console."
    end

  end


#SITEMAP_PAGE
  def sitemap_page

    #might want to switch the request.host_with_port to a config db in the db call. Don't know how reliable request.host_with_port is


    @sitemap = Page.find_sitemap (request.host_with_port)

    render :xml => @sitemap

  end


#RSS_PAGE
  def rss_page

    @rss = Page.find_rss (request.host_with_port)

    render :xml => @rss

  end


#LOGIN_PAGE
  def login_page

    respond_to do |format|
      format.html {render :layout => "layout_1"}
    end

  end

#GET_ADMIN
  def get_admin

    respond_to do |format|
      format.html {render :layout => "layout_1", :template => "/pages/admin"}
    end

  end


#GET_BLOG
  def get_blog

    @blog = Blog.find(params[:id])


    if !@blog.nil?
      respond_to do |format|
       format.html {render :layout => "layout_1", :template => "/pages/blog"}
     end
   else
    render :text => "You do not have permission to view the page your have requested. [error :: pc1001]"
   end


  end


#SECTION_SUB_PAGE
  def section_sub_page


    #check for "mobile" identifier in url and then use a different area that strips content from site.

    if (params[:section1] == "scr" && session[:user_id]) || params[:section1] != "scr"

      get_page_content(params[:section1],params[:section2],params[:section3],params[:section4],params[:page_name])

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


#GET_PAGE_CONTENT
  def get_page_content(section1,section2,section3,section4,page_name)

      (@page, @content1, @content2, @content3, @content4) = Page.find_page(section1,section2,section3,section4,page_name)

      @title = @page.title
      @description = @page.description
      @canonical = @page.url

      puts "***********controller says is adminc #{@is_admin}"



  end


end
