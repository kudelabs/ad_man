require 'test_helper'

module AdMan
  class AdvertisementTest < ActiveSupport::TestCase

#    Paperclip responsible for this:    
#    test "should not save advertisement without ad_banner" do
#      advertisement = Advertisement.new
#      advertisement.ad_banner = nil
#      assert !advertisement.save, "should not save without ad_banner"
#    end    
    
    test "should not save advertisement without keyword" do
      advertisement = Advertisement.new
      advertisement.ad_banner = sample_file
      assert !advertisement.keyword_id, "must have a keyword_id association"
      assert !advertisement.save, "should not save without keyword_id"
    end

    test "properly save without destination_url and title" do
      advertisement = Advertisement.new
      advertisement.ad_banner = sample_file
      keyword = Keyword.new
      keyword.name = "Test"
      keyword.save
      advertisement.keyword_id = keyword.id
      assert !advertisement.save, "should not save without destination_url and title"
    end   

    test "properly save" do
      advertisement = Advertisement.new
      advertisement.ad_banner = sample_file
      keyword = Keyword.new
      keyword.name = "Test"
      assert_nothing_raised do
        keyword.save!
      end  
      advertisement.keyword_id = keyword.id
      advertisement.title = "test"
      advertisement.destination_url = "test.com"
      assert advertisement.save, "is this valid information?"
    end
  end
end
