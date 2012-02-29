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

      def update_user
        unless File.exists?('app/models/user.rb')
          generate("model", "user email:string password_digest:string")
        end
        inject_into_class "app/models/user.rb", ::User do
          "  include Minnie::User::Auth\n\n  has_secure_password\n\n  attr_accessible :email, :password\n  validates_presence_of :email\n  validates_presence_of :password, :on => :create\n\n"
        end
      end
    end
  end
end