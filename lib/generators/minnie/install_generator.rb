module Minnie
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)
      desc "Configures your app with the basics for Minnie to execute."

      def install
        inject_into_class "app/controllers/application_controller.rb", ApplicationController do
          "  include Minnie::Auth\n\n  before_filter :authenticate_user!\n"       
        end      
      end

      def copy_sessions_controller
        copy_file "sessions_controller.rb", "app/controllers/sessions_controller.rb"
      end

      def copy_session_form
        copy_file "sessions/new.html.erb", "app/views/sessions/new.html.erb"
      end

      def copy_locale
        copy_file "en.yml", "config/locales/minnie.en.yml"
      end

      def add_session_routes
        route "resources :sessions, :only => [:new, :create, :destroy]"
        route "match '/signin' => 'sessions#new', :as => :signin"
        route "match '/signout' => 'sessions#destroy', :as => :signout"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end      
    end
  end
end