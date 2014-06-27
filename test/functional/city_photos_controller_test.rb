require 'test_helper'

class CityPhotosControllerTest < ActionController::TestCase
  setup do
    @city_photo = city_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:city_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create city_photo" do
    assert_difference('CityPhoto.count') do
      post :create, city_photo: { about: @city_photo.about, is_approved: @city_photo.is_approved, name: @city_photo.name, title: @city_photo.title, user_id: @city_photo.user_id }
    end

    assert_redirected_to city_photo_path(assigns(:city_photo))
  end

  test "should show city_photo" do
    get :show, id: @city_photo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @city_photo
    assert_response :success
  end

  test "should update city_photo" do
    put :update, id: @city_photo, city_photo: { about: @city_photo.about, is_approved: @city_photo.is_approved, name: @city_photo.name, title: @city_photo.title, user_id: @city_photo.user_id }
    assert_redirected_to city_photo_path(assigns(:city_photo))
  end

  test "should destroy city_photo" do
    assert_difference('CityPhoto.count', -1) do
      delete :destroy, id: @city_photo
    end

    assert_redirected_to city_photos_path
  end
end
