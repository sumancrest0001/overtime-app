require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = User.create(email: "demo123@gmail.com", first_name: "demo", last_name: "demo", avatar: "Demo demo", password: "demo123", password_confirmation: "demo123")
    end
    it "can be created" do
      expect(@user).to be_valid
    end

    it "can not be created without first and last name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end
end
