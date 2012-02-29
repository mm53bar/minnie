class SessionsController < ApplicationController  
  skip_before_filter :authenticate_user!, :except => [:destroy]

  def new  
    @user = User.new
  end  

  def create  
    if @user = User.authenticate(params[:user][:email], params[:user][:password])
      sign_in_and_redirect(@user)  
    else  
      @user = User.new
      flash.now[:error] = I18n.t(:invalid_login, :scope => 'app.sessions')
      render "new"  
    end  
  end  

  def destroy  
    sign_out_and_redirect
  end  
end