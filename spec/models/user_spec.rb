require 'rails_helper'

RSpec.describe User, type: :model do
  # associations
  it { should have_many(:restaurants) }
  
  # validations
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password_digest) }
  
  
  context 'Login Json' do
    it 'returns user' do
      @user = create(:user, email: "example@example.com", password: "password")
      expect(User.valid_login("example@example.com", "not the right password")).to eql nil
      expect(User.valid_login("example@example.com", "password")).to eql @user
    end
  end
  
  context 'logout json' do
    it 'invalidates the token' do
      @user = create(:user, token:"token")
      expect(@user.token).to eql "token"
      @user.logout
      expect(@user.token).to eql nil
    end
  end
  
end
