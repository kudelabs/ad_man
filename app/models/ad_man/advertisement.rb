module AdMan
  class Advertisement < ActiveRecord::Base
    attr_accessible :destination_url, :title
  end
end
