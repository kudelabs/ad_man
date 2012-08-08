module AdMan
  class Keyword < ActiveRecord::Base
    attr_accessible :name
		has_many :advertisements, :dependent => :destroy
		MAX_COUNT = (AdMan.max_count)?(AdMan.max_count):5
	#	scope :available, where("number_of_ads < ? ", MAX_COUNT)
	#	scope :unavailable, where("number_of_ads >= ?", MAX_COUNT) 
	#	after_initialize :init_number_of_ads

		def to_s
			name
		end

		def number_of_ads
			self.advertisements.count
		end
	  def self.available
			Keyword.all.select { |keyword| keyword.advertisements.count < MAX_COUNT}
		end

		def self.unavailable 
			Keyword.all.select { |keyword| keyword.advertisements.count >= MAX_COUNT}
		end
		private
		#set a default value for column number_of_ads
	#	def init_number_of_ads
	#		self.number_of_ads ||= 0
	#	end
  end
end
