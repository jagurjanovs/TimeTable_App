class User < ActiveRecord::Base
  #This takes care of authentication and verification
  has_secure_password

  #Downcase Email before saving,Just in case
  before_save { self.email = email.downcase }

  #Regular Expression to validate Email
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #Change these as per your requirement
  validates :title, presence: true, length: { minimum: 2, maximum: 4 }
  validates :fname, presence: true, length: { maximum: 45 }
  validates :lname, presence: true, length: { maximum: 45 }
  validates :email, presence: true,
            uniqueness: true, length: { minimum: 9, maximum: 9 }
  validates :password, length: { minimum: 6 }
  validates :course_enrolled, presence: true, length: { maximum: 5, minimum: 5 }

  def self.authenticate_user(email, password)
    user = find_by_email(email)
    if user && user.authenticate(password)
      user if user.email_confirmed
    else
      nil
    end
  end

  def send_confirmation
    self.update_column(:password_reset_token, SecureRandom.urlsafe_base64)
    self.update_column(:password_sent_at, Time.zone.now)
    UserMailer.send_confirmation_mail(self).deliver
  end

  #cookie management
  def generate_remember_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    self.update_column(:password_reset_token, SecureRandom.urlsafe_base64)
    self.update_column(:password_sent_at, Time.zone.now)
    UserMailer.send_password_reset_mail(self).deliver
  end

end
