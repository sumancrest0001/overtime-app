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
      post2.update(user_id: @user.id)
      visit posts_path
      expect(page).to have_content(/yesterday/)
    end

    it 'shows only cards created by the card creator' do
      post1 = Post.create(date: Date.today, rationale: 'Post created by user', user_id: @user.id)
      post2 = Post.create(date: Date.today, rationale: 'Post created by user', user_id: @user.id)
      non_authorize_user = User.create(first_name: 'non', last_name: 'authorize', email: 'non123@gmail.com', avatar: 'NonAuthorize', username: 'non0001', password: 'non123', password_confirmation: 'non123')
      post_from_other_user = Post.create(date: Date.today, rationale: 'Post created by the non authorize user', user_id: non_authorize_user.id)
      visit posts_path
      expect(page).not_to have_content(/Post created by the non authorize user/)
    end

    it 'has a title of posts' do
      visit posts_path
      expect(page).to have_content(/rationale/)
    end
  end

  describe 'new' do
    it "has a new link to create a post" do
      visit root_path
      click_link('new_post_from_nav')
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it "can be deleted" do
      post1 = FactoryBot.create(:post)
      post1.update(user_id: @user.id)
      visit posts_path
      click_link("delete_post_#{post1.id}_from_index")
      expect(page.status_code).to eq(200)
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

  describe 'edit' do
    before do
      @post = FactoryBot.create(:post)
    end

    it 'can be edited' do
      visit edit_post_path(@post)
      
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited content'
      click_on 'Save'
      expect(page).to have_content('Edited content')
    end

    it 'can not be edited by non-authorized user' do
      logout(:user)
      non_authorize_user = FactoryBot.create(:non_authorize_user)
      login_as(non_authorize_user, scope: :user)
      
      visit edit_post_path(@post)
      expect(current_path).to eql(root_path)
    end
  end
end