module Minnie
  module Auth
    extend ActiveSupport::Concern    

    module ClassMethods
      def authenticate(email, password)
        user = User.first(conditions: {email: email})
        return user && user.authenticate(password)        
      end
    end
  end
end