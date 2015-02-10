class SessionsController < ApplicationController
  def new
  end

  def create
    #Call authenticate_user method
    user = User.authenticate_user(params[:email], params[:password])

    #If user is authenticated store user.id in a session variable and redirect
    #Otherwise display flash message and render new
    if user
      sign_in user if params[:remember_me]
      session_create user.id
      redirect_to root_url
    else
      flash.now.alert = "Invalid Email or Password"
      render 'new'
    end
  end

    def destroy
      sign_out
      session_destroy
      flash[:notice] = "Signed out successfully"
      redirect_to root_url
    end

    private
    def check_signed_in
     if signed_in?
        flash.now.alert = "Already signed in"
        redirect_to rool_url
      end
    end
end
