module AdMan
  class Advertisement < ActiveRecord::Base
    attr_accessible :destination_url, :title, :ad_banner, :display_count, :priority, :start_date, :end_date, :click_count
    validates_with AttachmentPresenceValidator, :attributes => :ad_banner
    belongs_to :keyword
    has_attached_file :ad_banner, :styles => { :leaderboard => (AdMan.leaderboard_size)?(AdMan.leaderboard_size):'728X90', 
																							:banner => (AdMan.banner_size)?(AdMan.banner_size):'468X60' }
  	validates_attachment :ad_banner, :presence => true, 
  		:content_type => { :content_type => (AdMan.content_type)?(AdMan.content_type):
				["image/jpg","image/bmp","image/png", "image/gif", "image/jpeg"] 	},
  		:size => { :in => 0..AdMan.max_image_size.kilobytes } 
  	validates_presence_of :destination_url, :title, :keyword_id, :priority
		validates_uniqueness_of :title
  	validate :image_dimensions, :on => :create

  	def Advertisement.render_random_ad(keyword_id)
#  		ads = Advertisement.find_all_by_keyword_id(keyword_id)
			ads = Advertisement.where("keyword_id = ? AND start_date <= ? AND end_date >= ? ", keyword_id, Date.today, Date.today)
			if !ads.blank?
				total_times = 1.0
				total_priority = 0.0
				ads.each { |advertisement| 
					total_times += advertisement.display_count
					total_priority += advertisement.priority
				}
				ad = ads[rand(ads.size)]
				while((ad.display_count / total_times) > (ad.priority / total_priority))
					ad = ads[rand(ads.size)]
				end
				ad
			end
	  end
    
		def Advertisement.render_random_ad
			ads = Advertisement.all
			ad = ads[rand(ads.size)]
		end

  	private
    def image_dimensions
      temp_file = ad_banner.queued_for_write[:leaderboard] #get the file
      dimensions = Paperclip::Geometry.from_file(temp_file)        
			max_width = (AdMan.image_dimensions_width)?(AdMan.image_dimensions_width):728
			max_height = (AdMan.image_dimensions_height)?(AdMan.image_dimensions_height):90
      if (dimensions.width > max_width) || (dimensions.height > max_height)
         errors.add("banner_dimmensions",
										"must be image size: #{max_width}X#{max_height}.")
      end
    end
	
  end
end


