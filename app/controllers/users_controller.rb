class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to(:action => 'show',:id => @user.id)
    else
    render('show')
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  def index
    @users = User.all
  end

  def create
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



  def account_confirmation
    @user = User.find_by_password_reset_token(params[:token])
    if(@user)
      @user.update_column(:email_confirmed, true)
      @user.update_column(:password_reset_token, nil)
      redirect_to new_session_path, :notice => "Account confirmed"
    else
      redirect_to new_session_path, :notice => "Account could not be confirmed"
    end
  end

  private
  def user_params
    params.require(:user).permit(:title, :fname,:lname, :email,:password,:password_confirmation, :course_enrolled)
  end

  def check_signed_in
    if !signed_in?
      flash.alert.now = "Please sign in to continue"
      redirect_to root_url
    else
      @user = current_user
    end
  end


end

