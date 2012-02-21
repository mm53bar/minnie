module Minnie
  module Authentication
    def self.included(klass)
      include InstanceMethods
    end

    module InstanceMethods     
      def authenticate_user!
        redirect unless session[:user_id] && User.first(:conditions => {:id => session[:user_id]})
      end  

      def sign_in_and_redirect(user, options = {})
        session[:user_id] = user.id
        options.reverse_merge!({:notice => I18n.t(:signed_in, :scope => 'app.sessions')})
        redirect_to after_sign_in_path, options
      end
    
      def sign_out_and_redirect(options = {})
        reset_session
        options.reverse_merge!({:notice => I18n.t(:signed_out, :scope => 'app.sessions')})
        redirect_to after_sign_out_path, options
      end

      protected

      def current_user
        @current_user ||= User.first(:conditions => {:id => session[:user_id]}) if session[:user_id]
      end
    
      def redirect
        store_location!
        store_params!
        redirect_to new_session_path
      end
    
      def store_location!
        session[:return_to] = request.fullpath if request.get?
      end
    
      def stored_location
        session.delete("return_to")
      end
    
      def store_params!
        session[:params] = params
      end

      def stored_params
        session[:params] || {}
      end

      def after_sign_in_path
        stored_location || root_path
      end
    
      def after_sign_out_path
        root_path
      end
    end
  end
end