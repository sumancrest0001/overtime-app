require 'rails_helper'

describe 'navigate' do
  before do
    @user = User.create(email: "demo123@gmail.com", first_name: "demo", last_name: "demo", avatar: "Demo demo", password: "demo123", password_confirmation: "demo123")
    login_as(@user, :scope => :user)
  end
  describe 'homepage' do
    it 'can be visited successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end
    it 'has a list of Posts' do
      post1 = Post.create(date:Date.today, rationale: "Post1", user_id: @user.id)
      post2 = Post.create(date:Date.today, rationale: "Post2", user_id: @user.id)
      visit posts_path
      expect(page).to have_content(/Post1|Post2/)
    end
    it 'has a title of posts' do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end
    it "has a new form that can be reached" do
      expect(page.status_code).to eql(200)
    end

    it "can be created from new form page" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Some rationale'
      click_on "Save"

      expect(page).to have_content("Some rationale")
    end

    it "will have a user assiciated with it" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'user association demo'
      click_on "Save"

      expect(User.last.posts.last.rationale).to eq('user association demo')
    end
  end
end