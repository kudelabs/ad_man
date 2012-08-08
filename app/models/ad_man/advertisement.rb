module AdMan
  class Advertisement < ActiveRecord::Base
    attr_accessible :destination_url, :title, :ad_banner, :display_count, :priority, :start_date, :expire_date
    validates_with AttachmentPresenceValidator, :attributes => :ad_banner
    belongs_to :keyword
    has_attached_file :ad_banner, :styles => { :original => (AdMan.original_size)?(AdMan.original_size):'728X90', 
																							:small => (AdMan.small_size)?(AdMan.small_size):'468X60' }
  	validates_attachment :ad_banner, :presence => true, 
  		:content_type => { :content_type => (AdMan.content_type)?(AdMan.content_type):
				["image/jpg","image/bmp","image/png", "image/gif", "image/jpeg"] 	},
  		:size => { :in => 0..50.kilobytes }
  	validates_presence_of :destination_url, :title, :keyword_id, :priority
  	validate :image_dimensions, :on => :create
  	after_create :increase_count  
  	after_destroy :decrease_count	
  
		after_initialize :init_display_count

  	def Advertisement.render_random_ad(keyword_id)
#  		ads = Advertisement.find_all_by_keyword_id(keyword_id)
			ads = Advertisement.where("keyword_id = ? and expire_date >= ? ", keyword_id, Date.today)
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
    
  	private
    def image_dimensions
      temp_file = ad_banner.queued_for_write[:original] #get the file
      dimensions = Paperclip::Geometry.from_file(temp_file)        
			max_width = (AdMan.image_dimensions_width)?(AdMan.image_dimensions_width):728
			max_height = (AdMan.image_dimensions_height)?(AdMan.image_dimensions_height):90
      if (dimensions.width > max_width) || (dimensions.height > max_height)
         errors.add("banner_dimmensions",
										"must be image size: #{max_width}X#{max_height}.")
      end
    end
   
		#increase the number of advertisements for the keyword by one after creating an advertiseent.
  	def increase_count
  		number = self.keyword.number_of_ads + 1
  		self.keyword.update_attributes(:number_of_ads => number)
  	end

		#decrease the number of advertisements for the keyword by one after destroying an advertisement.
  	def decrease_count
  		number = self.keyword.number_of_ads - 1
  		self.keyword.update_attributes(:number_of_ads => number)
  	end
	
		#set a default value for column display_count
		def init_display_count
			self.display_count ||= 0
		end

  end
end


