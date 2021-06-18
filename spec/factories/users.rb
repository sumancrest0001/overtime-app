FactoryBot.define do
  factory :user do
    first_name {'demo'}
    last_name {'demo'}
    email {'demo123@gmail.com'}
    avatar {'Demodemo'}
    username {'demo0001'}
    password {"demo123"}
    password_confirmation {"demo123"}
  end

  factory :second_user, class: "AdminUser" do
    first_name {'random'}
    last_name {'shrestha'}
    email {'random123@gmail.com'}
    avatar {'randomShrestha'}
    username {'random123'}
    password {"random123"}
    password_confirmation {"random123"}
  end
end