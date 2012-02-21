module Minnie
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)
      desc "Configures your app with the basics for Minnie to execute."

      def copy_locale
        copy_file "en.yml", "config/locales/minnie.en.yml"
      end

      def add_session_routes
        route "resources :sessions, :only => [:new, :create, :destroy]"
        route "match '/signin' => 'sessions#new', :as => :signin"
        route "match '/signout' => 'sessions#destroy', :as => :signout"
      end
    end
  end
end