class UsersController < ApplicationController
  #make new user method
  def new
    @user = User.new
  end

  #show all users method
  def show
    @user = User.find(params[:id])
  end

  #edit user details
  def edit
    @user = User.find(params[:id])
  end

  #update user details
  def update
    #find user object by user id
    @user = User.find(params[:id])

    #if user updates the attributes of the user object
    if @user.update_attributes(user_params)
      #redirect them to show, and set id to the user's id
      redirect_to(:action => 'show',:id => @user.id)
    else
      #otherwise send back to index page
      render('index')
    end
  end

  #delete user
  def delete
    @user = User.find(params[:id])
  end

  #remove user from system
  def destroy
    #find user object by user's id and destroy that object
    User.find(params[:id]).destroy
    #then send back to index page
    redirect_to(:action => 'index')
  end

  #define the variable @users as all users
  def index
    @users = User.all
  end

  #make a new user object
  def create
    #create new user with user params
    @user = User.new(user_params)
    #Redirect to root url with success message if registered, otherwise render new
    if @user.valid? && @user.save!
      @user.send_confirmation
      redirect_to root_url
      flash[:notice] = "User Registered successfully"
    else
      render 'new'
    end
  end


  #email confirmation of account validity
  def account_confirmation
    #find the user by the password reset token they supply
    @user = User.find_by_password_reset_token(params[:token])
    #if a user with this password reset token exists
    if(@user)
      #set their email confirmed field to true and wipe the password reset token
      @user.update_column(:email_confirmed, true)
      @user.update_column(:password_reset_token, nil)
      #tell user their account has been confirmed.
      redirect_to new_session_path, :notice => "Account confirmed"
    else
      #otherwise tell them that their account could not be confirmed.
      redirect_to new_session_path, :notice => "Account could not be confirmed"
    end
  end

  #private method to define the necessary parameters for creating a new user object
  private
  def user_params
    params.require(:user).permit(:title, :fname,:lname, :email,:password,:password_confirmation, :course_enrolled)
  end

  #private method to check if user is signed in
  def check_signed_in
    #if user isn't signed in tell them they need to and take them to the root url (homepage)
    if !signed_in?
      flash.alert.now = "Please sign in to continue"
      redirect_to root_url
    else
      #otherwise set user to be the currently signed in user.
      @user = current_user
    end
  end


end

