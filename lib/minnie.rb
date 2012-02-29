require "minnie/version"

module Minnie
  autoload :Auth, 'minnie/auth'
  module User
    autoload :Auth, 'minnie/user/auth'
  end
end
