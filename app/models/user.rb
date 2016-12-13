class User < ActiveRecord::Base
  has_secure_password

  has_many :comments

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    # if user exists in database, authenticate by entered password else will return nil
    user.authenticate(password) if user.present?
  end


  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, :last_name, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
end
