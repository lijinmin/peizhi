require 'test_helper'

class WechatsControllerTest < ActionController::TestCase
  setup do
    @wechat = wechats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wechats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wechat" do
    assert_difference('Wechat.count') do
      post :create, wechat: {  }
    end

    assert_redirected_to wechat_path(assigns(:wechat))
  end

  test "should show wechat" do
    get :show, id: @wechat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wechat
    assert_response :success
  end

  test "should update wechat" do
    patch :update, id: @wechat, wechat: {  }
    assert_redirected_to wechat_path(assigns(:wechat))
  end

  test "should destroy wechat" do
    assert_difference('Wechat.count', -1) do
      delete :destroy, id: @wechat
    end

    assert_redirected_to wechats_path
  end
end
