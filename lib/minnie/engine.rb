require 'minnie'
require 'rails'

module Minnie
  class Engine < Rails::Engine
    initializer "extend Controller with minnie" do |app|
      ActionController::Base.send(:include, Minnie::Controller)
      ActionController::Base.helper_method :current_user
    end
  end
end