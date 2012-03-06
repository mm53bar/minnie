module Minnie
  module User
    module Auth
      def self.included(klass)
        klass.extend ClassMethods
      end

      module ClassMethods
        def authenticate(email, password)
          user = self.first(conditions: {email: email})
          return user && user.authenticate(password)        
        end
      end
    end
  end
end