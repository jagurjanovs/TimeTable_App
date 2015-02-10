class PasswordResetsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.send_password_reset
      flash.now.alert = "Email has been sent with reset password instructions"
    else
      flash.now.alert = "This email is not registered with us."
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
        if @user.update_attributes(edit_params)
      @user.update_attribute(:password_reset_token, nil)
      redirect_to new_session_url, :notice => "Password has been reset."
    else
      render "edit"
    end
  end

  private
  def edit_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
