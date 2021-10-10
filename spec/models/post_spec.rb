require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      user = FactoryBot.create(:user)
      @post = FactoryBot.build_stubbed(:post)
    end

    it "can be created" do
      expect(@post).to be_valid
    end
    
    it "can not be created without a date, overtime request and rationale" do
      @post.date = nil
      @post.rationale = nil
      @post.overtime_request = nil
      expect(@post).to_not be_valid
    end
  end
end
