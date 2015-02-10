class UserMailer < ActionMailer::Base
  default from: "testemailgroup1@gmail.com"

  def send_confirmation_mail(user)
    @user = user
    mail(to: @user.email + '@umail.ucc.ie', subject: 'User Registration confirmation')
  end

    def send_password_reset_mail(user)
      @user = user
      mail(to: user.email + '@umail.ucc.ie', subject: 'Password Reset')
    end
end

