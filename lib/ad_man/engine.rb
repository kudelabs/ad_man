require 'paperclip'

module AdMan
  class Engine < ::Rails::Engine
    isolate_namespace AdMan
    
		#expose helper methods to the consumer application 
		initializer 'ad_man.action_controller' do |app|
			ActiveSupport.on_load :action_controller do 
				helper AdMan::ApplicationHelper
			end
    end
  end
end
