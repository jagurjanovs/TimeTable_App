class SessionsController < ApplicationController
  def new
  end

  def create
    #Call authenticate_user method
    user = User.authenticate_user(params[:username], params[:password])

    #If user is authenticated store user.id in a session variable and redirect
    #Otherwise display flash message and render new
    if user
      sign_in user if params[:remember_me]
      session_create user.id
      redirect_to root_url
    else
      flash.now.alert = "Invalid Username or Password"
      render 'new'
    end
  end

  #Destroy the session identity
  def destroy
    #sign user out method
    sign_out
    #end session
    session_destroy
    #notify user that session has ended
    flash[:notice] = "Signed out successfully"
    #send user back to homepage
    redirect_to root_url
  end

  #private method to check if the user is signed in
  private
  def check_signed_in
    #if yes tell user and redirect to home page.
    if signed_in?
      flash.now.alert = "Already signed in"
      redirect_to rool_url
    end
  end
end
