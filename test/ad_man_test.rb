require 'test_helper'

class AdManTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, AdMan
  end
  
  test "default configs" do
    assert_equal "728X90", AdMan.leaderboard_size.upcase
    assert_equal "468X60", AdMan.banner_size.upcase
    assert_equal "320X50", AdMan.mobile_leaderboard_size.upcase
    assert_equal "250X250", AdMan.square_size.upcase
    assert_equal "200X200", AdMan.small_square_size.upcase
    assert_equal "336X280", AdMan.large_rectangle_size.upcase
    assert_equal "300X250", AdMan.inline_rectangle_size.upcase
    assert_equal "120X600", AdMan.skyscraper_size.upcase
    assert_equal "160X600", AdMan.wide_skyscraper_size.upcase
  end
end
