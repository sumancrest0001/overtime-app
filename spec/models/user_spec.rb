require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = FactoryBot.create(:user)
    end
    it "can be created" do
      expect(@user).to be_valid
    end

    it "can not be created without first and last name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "shows full name of the user" do
      expect(@user.full_name).to eq('demo demo')
    end
  end
end
