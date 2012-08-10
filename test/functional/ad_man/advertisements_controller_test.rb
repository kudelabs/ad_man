require 'test_helper'

module AdMan
  class AdvertisementsControllerTest < ActionController::TestCase
    setup do
      @advertisement = advertisements(:one)
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
        post :create, advertisement: { destination_url: @advertisement.destination_url, title: @advertisement.title }
          #  ad_banner: @advertisement.ad_banner, :keyword_id, :start_date, :end_date
          #  } 
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
      put :update, id: @advertisement, advertisement: { destination_url: @advertisement.destination_url, title: @advertisement.title }
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
