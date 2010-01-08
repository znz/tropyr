require 'test_helper'

class TropiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tropies)
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
    get :show, :id => tropies(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tropies(:one).to_param
    assert_response :success
  end

  test "should update tropy" do
    put :update, :id => tropies(:one).to_param, :tropy => { }
    assert_redirected_to tropy_path(assigns(:tropy))
  end

  test "should destroy tropy" do
    assert_difference('Tropy.count', -1) do
      delete :destroy, :id => tropies(:one).to_param
    end

    assert_redirected_to tropies_path
  end
end
