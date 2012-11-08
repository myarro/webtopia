class WebsiteSettingsController < ApplicationController

  before_filter :authenticate_admin
  before_filter :check_session

    # GET /website_settings
  # GET /website_settings.json
  def index
    @website_settings = WebsiteSetting.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @website_settings }
    end
  end

  # GET /website_settings/1
  # GET /website_settings/1.json
  def show
    @website_setting = WebsiteSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @website_setting }
    end
  end

  # GET /website_settings/new
  # GET /website_settings/new.json
  def new
    @website_setting = WebsiteSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @website_setting }
    end
  end

  # GET /website_settings/1/edit
  def edit
    @website_setting = WebsiteSetting.find(params[:id])
  end

  # POST /website_settings
  # POST /website_settings.json
  def create
    @website_setting = WebsiteSetting.new(params[:website_setting])

    respond_to do |format|
      if @website_setting.save
        format.html { redirect_to @website_setting, notice: 'Website setting was successfully created.' }
        format.json { render json: @website_setting, status: :created, location: @website_setting }
      else
        format.html { render action: "new" }
        format.json { render json: @website_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /website_settings/1
  # PUT /website_settings/1.json
  def update
    @website_setting = WebsiteSetting.find(params[:id])

    respond_to do |format|
      if @website_setting.update_attributes(params[:website_setting])
        format.html { redirect_to @website_setting, notice: 'Website setting was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @website_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /website_settings/1
  # DELETE /website_settings/1.json
  def destroy
    @website_setting = WebsiteSetting.find(params[:id])
    @website_setting.destroy

    respond_to do |format|
      format.html { redirect_to website_settings_url }
      format.json { head :ok }
    end
  end
end
