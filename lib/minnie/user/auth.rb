module Minnie
  module User
    module Auth
      extend ActiveSupport::Concern    

      module ClassMethods
        def authenticate(email, password)
          user = self.first(conditions: {email: email})
          return user && user.authenticate(password)        
        end
      end
    end
  end
end