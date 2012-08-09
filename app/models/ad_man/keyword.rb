module AdMan
  class Keyword < ActiveRecord::Base
    attr_accessible :name
		has_many :advertisements, :dependent => :destroy
		MAX_COUNT = (AdMan.max_count)?(AdMan.max_count):5

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
  end
end
