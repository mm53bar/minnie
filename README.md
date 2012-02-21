#Minnie

###Install

Add minnie to your Gemfile

     gem 'minnie'

Include minnie's authentication in application_controller.rb and set it to require
authentication for every controller

     class ApplicationController
       include Minnie::Authentication

       before_filter :authenticate_user!
       
       ...

Create a sessions_controller.rb

     class SessionsController < ApplicationController  
       skip_before_filter :authenticate_user!, :except => [:destroy]

       def new  
         @user = User.new
       end  

       def create  
         if @user = authenticate(params[:user][:email], params[:user][:password])
           sign_in_and_redirect(@user)  
         else  
           flash.now[:error] = I18n.t(:invalid_login, :scope => 'app.sessions')
           render "new"  
         end  
       end  

       def destroy  
         sign_out_and_redirect
       end  
     end

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

