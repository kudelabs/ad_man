require 'test_helper'

module AdMan
  class KeywordsControllerTest < ActionController::TestCase
    setup do
      @keyword = ad_man_keywords(:one)
      @routes = AdMan::Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:keywords)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create keyword" do
      assert_difference('Keyword.count') do
        post :create, keyword: { name: 'RandomName' }
      end
      assert_redirected_to advertisements_path
    end

    test "should show keyword" do
      get :show, id: @keyword
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @keyword
      assert_response :success
    end

    test "should update keyword" do
      put :update, id: @keyword, keyword: { name: @keyword.name }
      assert_redirected_to advertisements_path
    end

    test "should destroy keyword" do
      assert_difference('Keyword.count', -1) do
        delete :destroy, id: @keyword
      end
      assert_redirected_to advertisements_path
    end
  end
end
