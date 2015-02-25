class UserMailer < ActionMailer::Base
  #always send mail from this address unless specified otherwise
  default from: "testemailgroup1@gmail.com"

  #method to send account confirmation email to @param user
  def send_confirmation_mail(user)
    #set method attribute 'user' to param 'user'
    @user = user
    #send user Registration email to that user
    mail(to: @user.username + '@umail.ucc.ie', subject: 'User Registration confirmation')
  end

  #method to send password reset email to @param user
  def send_password_reset_mail(user)
    #set method attribute 'user' to param 'user'
  @user = user
      mail(to: user.username + '@umail.ucc.ie', subject: 'Password Reset')
    end
end

