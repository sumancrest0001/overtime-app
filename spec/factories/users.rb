FactoryBot.define do
  sequence :email do |i|
    "test#{i}@example.com"
  end
  factory :user do
    first_name {'demo'}
    last_name {'demo'}
    email {generate :email}
    avatar {'Demodemo'}
    username {'demo0001'}
    password {"demo123"}
    password_confirmation {"demo123"}
  end

  factory :second_user, class: "AdminUser" do
    first_name {'random'}
    last_name {'shrestha'}
    email {generate :email}
    avatar {'randomShrestha'}
    username {'random123'}
    password {"random123"}
    password_confirmation {"random123"}
  end

  factory :non_authorize_user, class: 'User' do
    first_name {'non'}
    last_name {'authorize'}
    email {generate :email}
    avatar {'NonAuthorize'}
    username {'non0001'}
    password {"non123"}
    password_confirmation {"non123"}
  end
end