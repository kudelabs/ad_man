require "ad_man/engine"

module AdMan
	mattr_accessor :original_size, :small_size
	mattr_accessor :image_dimensions_width, :image_dimensions_height
	mattr_accessor :content_type
	mattr_accessor :max_count
end
