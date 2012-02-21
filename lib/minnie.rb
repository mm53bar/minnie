require "minnie/version"

module Minnie
  autoload :Controller, 'minnie/controller'

  require 'minnie/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
end
