class User < ApplicationRecord
  has_many :restaurants
  
  has_secure_password
  has_secure_token
  
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password_digest, presence: true
  
  def self.valid_login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      return @user
    end
  end
  
  def allow_token_to_be_used_only_once
    regenerate_token
  end
  
  def logout
    invalidate_token
  end
  
  private

  def invalidate_token
    update_columns(token: nil)
  end
  
end
