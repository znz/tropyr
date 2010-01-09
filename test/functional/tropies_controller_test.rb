require 'test_helper'

class TropiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:refresh_url)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tropy" do
    assert_difference('Tropy.count') do
      post :create, :tropy => { }
    end

    assert_redirected_to tropy_path(assigns(:tropy))
  end

  test "should show tropy" do
    #get :show, :id => tropies(:one).to_param
    get :show, :pageid => tropies(:one).pageid
    assert_response :success
  end

  test "should get edit" do
    #get :edit, :id => tropies(:one).to_param
    get :edit, :pageid => tropies(:one).pageid
    assert_response :success
  end

  test "should update tropy" do
    #put :update, :id => tropies(:one).to_param, :tropy => { }
    put :update, :pageid => tropies(:one).pageid, :tropy => { }
    assert_redirected_to tropy_path(assigns(:tropy))
  end

  test "should destroy tropy" do
    assert_difference('Tropy.count', -1) do
      #delete :destroy, :id => tropies(:one).to_param
      delete :destroy, :pageid => tropies(:one).pageid
    end

    #assert_redirected_to tropies_path
    assert_redirected_to random_path
  end
end
