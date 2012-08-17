module AdMan
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)  
    def create_extended_controller_file
      template "advertisements_controller.rb","app/controllers/ad_man/advertisements_controller.rb"
      template "keywords_controller.rb","app/controllers/ad_man/keywords_controller.rb"
    end

    def add_routes
      route("mount AdMan::Engine => "/ad_man")
    end

    def install_migrations
      rake "ad_man:install:migrations"
    end
  end
end

