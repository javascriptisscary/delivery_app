require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  context "Methods" do
    describe 'is_admin?' do
      it 'returns true' do
        @user = build(:user, is_admin:1)
        expect(@user.is_admin?).to eql true
      end
      
      it 'returns false' do
        @user = create(:user)
        expect(@user.is_admin?).to eql false
      end
    end
  end

end