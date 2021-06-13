require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      user = User.create(email: "demo123@gmail.com", first_name: "demo", last_name: "demo", avatar: "Demo demo", password: "demo123", password_confirmation: "demo123")
      @post = Post.create(date:Date.today, rationale: "First test post", user_id: user.id)
    end

    it "can be created" do
      expect(@post).to be_valid
    end
    
    it "can not be created without a date and rationale" do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
end
