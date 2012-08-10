class AdManGenerator < Rails::Generators::Base
	def create_extended_controller_file
		create_file "app/controllers/ad_man/advertisements_controller.rb",
			%Q[require AdMan::Engine.config.root + 'app' + 'controllers' + 'ad_man' + 'advertisements_controller'
			AdMan::AdvertisementsController.class_eval do 
			end]

		create_file "app/controllers/ad_man/keywords_controller.rb",
			%Q[require AdMan::Engine.config.root + 'app' + 'controllers' + 'ad_man' + 'keywords_controller'
				AdMan::KeywordsController.class_eval do
				end]
	end
	
	
	def add_routes
		route("mount AdMan::Engine, :at => 'ad_man'")
	end
end	
	
