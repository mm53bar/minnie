module Minnie
  module Auth
    def self.included(klass)
      klass.send :helper_method, :current_user, :authenticated?,
                 :signed_in? if klass.respond_to? :helper_method
      klass.send :hide_action, :authenticate!, :sign_in_and_redirect,
                  :sign_out_and_redirect, :current_user if klass.respond_to? :hide_action
    end

    def authenticate!
      redirect unless authenticated?
    end

    def authenticated?
      current_user.present?
    end
    alias_method :signed_in?, :authenticated?

    def sign_in_and_redirect(user, options = {})
      remember(user)
      options.reverse_merge!({notice: I18n.t(:signed_in, scope: 'app.sessions')})
      redirect_to after_sign_in_path, options
    end

    def sign_out_and_redirect(options = {})
      forget_user
      options.reverse_merge!({notice: I18n.t(:signed_out, scope: 'app.sessions')})
      redirect_to after_sign_out_path, options
    end

    def current_user
      @current_user ||= ::User.find_by(id: cookies.signed[:user_id],
                                       remember_token: cookies[:remember_token])
    end

    private

    def redirect
      forget_user
      store_location!
      store_params!
      redirect_to sign_in_path
    end

    def remember(user)
        remember_token = user.remember_token || SecureRandom.urlsafe_base64
        user.update(remember_token: remember_token)
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = remember_token
    end

    def forget_user
      reset_session
      @current_user = nil
      cookies.delete(:user_id)
      cookies.delete(:remember_token)
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

    def sign_in_path
      new_session_path
    end

    def after_sign_in_path
      stored_location || root_path
    end

    def after_sign_out_path
      root_path
    end
  end
end
