module Minnie
  module Generators
    module Install
      class UserGenerator < Rails::Generators::Base

        desc "Creates (if needed) and configures a user model for Minnie."

        def update_user
          unless File.exists?('app/models/user.rb')
            generate("model", "user email:string password_digest:string")
          end
          inject_into_class "app/models/user.rb", ::User do
            "  include Minnie::User::Auth\n\n  has_secure_password\n\n  attr_accessible :email, :password\n  validates_presence_of :email\n  validates_presence_of :password, on: :create\n\n"
          end
        end
      end
    end
  end
end
