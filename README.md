#Minnie

###Install

Add minnie to your Gemfile

     gem 'minnie'

Run minnie's generator to get some basic bootstrapping for your routes,
sessions_controller and locales

     bundle exec rails generate minnie:install

Include minnie's authentication in application_controller.rb and set it to require
authentication for every controller

     class ApplicationController
       include Minnie::Authentication

       before_filter :authenticate_user!
       
       ...


And a login form at app/views/sessions/new.html.erb (this one uses simple_form)

     <h2>Sign in</h2>  
  
     <%= simple_form_for @user, :url => sessions_path do |f| %>  
       <%= f.error_notification %>

       <div class="inputs">
         <%= f.input :email %>
         <%= f.input :password %>
       </div>
       <div class="actions">
         <%= f.button :submit, 'Sign In' %>
       </div>
     <% end %> 

Generate a user.rb that is set up for has_secure_password

     bundle exec rails g model user email:string password_digest:string

And then update app/models/user.rb to include has_secure_password

     class User < ActiveRecord::Base
       has_secure_password
     end

