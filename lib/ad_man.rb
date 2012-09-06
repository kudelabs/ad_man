require "ad_man/engine"

module AdMan
  # advert size names
  mattr_accessor :leaderboard_size,
    :banner_size,
    :mobile_leaderboard_size,
    :square_size,
    :small_square_size,
    :large_rectangle_size,
    :inline_rectangle_size,
    :skyscraper_size,
    :wide_skyscraper_size

  mattr_accessor :image_dimensions_width, :image_dimensions_height
  mattr_accessor :max_image_size
  mattr_accessor :content_type
  mattr_accessor :max_count

  # initialize default sizes
  self.leaderboard_size = "728X90"
  self.banner_size = '468X60'
  self.mobile_leaderboard_size = '320X50'
  self.square_size = '250X250'
  self.small_square_size = '200X200'
  self.large_rectangle_size = '336X280'
  self.inline_rectangle_size = '300X250'
  self.skyscraper_size = '120X600'
  self.wide_skyscraper_size = '160X600'

  # other attributes
  self.max_image_size = 50
  self.content_type = ["image/jpg","image/bmp","image/png", "image/gif", "image/jpeg"]
  self.image_dimensions_height = 90
  self.image_dimensions_width = 728
end
