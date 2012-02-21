#Minnie

###Install

Add minnie to your Gemfile

     gem 'minnie'

Run minnie's generator to get some basic bootstrapping for your routes,
sessions_controller and locales

     bundle exec rails generate minnie:install

Generate a user.rb that is set up for has_secure_password

     bundle exec rails g model user email:string password_digest:string


