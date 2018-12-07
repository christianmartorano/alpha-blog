class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "You successfully loged in."
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.now[:danger] = "You enter incorrect username/password."
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You successfully logged out."
    redirect_to root_path
  end
  
end
