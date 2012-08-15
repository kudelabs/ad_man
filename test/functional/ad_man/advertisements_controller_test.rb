require 'test_helper'

module AdMan
  class AdvertisementsControllerTest < ActionController::TestCase

    setup do
      @advertisement = ad_man_advertisements(:rubyonrails)
      @routes = AdMan::Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:advertisements)
      assert_not_nil assigns(:keywords)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create advertisement" do
      assert_difference('Advertisement.count') do
        post :create, advertisement: {
          destination_url: "http://stackoverflow.com/",
          title: "UniqueTitle",
          ad_banner: fixture_file_upload("/test.jpeg","image/jpeg"),
          display_count: 0,
          click_count: 0,
          priority: 1
        }, keyword_id: 1
      end

      assert_redirected_to advertisement_path(assigns(:advertisement))
    end

    test "should show advertisement" do
      get :show, id: @advertisement
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @advertisement
      assert_response :success
    end

    test "should update advertisement" do
      put :update, id: @advertisement, advertisement: {
        destination_url: "http://stackoverflow.com/",
        title: "UniqueTitle",
        ad_banner: fixture_file_upload("/test.jpeg","image/jpeg"),
        display_count: 0,
        click_count: 0,
        priority: 1
        }, keyword_id: 1
      assert_redirected_to advertisement_path(assigns(:advertisement))
    end

    test "should destroy advertisement" do
      assert_difference('Advertisement.count', -1) do
        delete :destroy, id: @advertisement
      end

      assert_redirected_to advertisements_path
    end
  end
end
