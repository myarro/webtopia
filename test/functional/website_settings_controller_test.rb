require 'test_helper'

class WebsiteSettingsControllerTest < ActionController::TestCase
  setup do
    @website_setting = website_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:website_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create website_setting" do
    assert_difference('WebsiteSetting.count') do
      post :create, website_setting: @website_setting.attributes
    end

    assert_redirected_to website_setting_path(assigns(:website_setting))
  end

  test "should show website_setting" do
    get :show, id: @website_setting.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @website_setting.to_param
    assert_response :success
  end

  test "should update website_setting" do
    put :update, id: @website_setting.to_param, website_setting: @website_setting.attributes
    assert_redirected_to website_setting_path(assigns(:website_setting))
  end

  test "should destroy website_setting" do
    assert_difference('WebsiteSetting.count', -1) do
      delete :destroy, id: @website_setting.to_param
    end

    assert_redirected_to website_settings_path
  end
end
