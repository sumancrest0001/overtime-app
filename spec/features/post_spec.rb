require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryBot.create(:second_user)
    login_as(@user, :scope => :user)
  end
  describe 'homepage' do
    it 'can be visited successfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end
    it 'has a list of Posts' do
      post1 = FactoryBot.create(:post)
      post2 = FactoryBot.create(:second_post)
      visit posts_path
      expect(page).to have_content(/yesterday|now/)
    end
    it 'has a title of posts' do
      visit posts_path
      expect(page).to have_content(/rationale/)
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