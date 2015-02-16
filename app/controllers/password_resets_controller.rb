class PasswordResetsController < ApplicationController

  def new #Creates new Password_Reset
  end

  #Creates password reset object
  def create
    @user = User.find_by_email(params[:email]) #finds user object by their email address
    if @user # if the user is in the system
      @user.send_password_reset #run method to email them a password reset link
      #Tell user this has been done
      flash.now.alert = "Email has been sent with reset password instructions"
    else
      #Otherwise tell user they are not registered
      flash.now.alert = "This email is not registered with us."
    end
  end #end method

  def edit #edit user details if they have the password reset token
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update # method to change user's password after they click the password reset link @param nonee ,@ result none
    @user = User.find_by_password_reset_token!(params[:id]) #user found by password reset token attached to their account
    if @user.update_attributes(edit_params) #if the user updates their password
      @user.update_attribute(:password_reset_token, nil) #set the reset toke to nil
      redirect_to new_session_url, :notice => "Password has been reset." #tell the user the password has been reset.
    else
      #otherwise send them to the 'edit' method to change their password.
      render "edit"
    end
  end

  private
  #private method to define what params are needed to reset a password
  def edit_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
#end of file.