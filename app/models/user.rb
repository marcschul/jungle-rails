class User < ActiveRecord::Base
  
  has_secure_password

  validates :name, presence: true
  validates :password, confirmation: true, length: { minimum: 3 }
  validates :email, uniqueness: { case_sensitive: false }
  before_save { self.email.downcase! }

  def self.authenticate_with_credentials(email, password)
    #trim email parameter
    strip_email = email.strip.downcase
    user = User.find_by_email(strip_email)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
