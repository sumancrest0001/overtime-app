@user = User.create(email: "demo123@gmail.com", first_name: "demo", last_name: "demo", avatar: "Demo demo", password: "demo123", password_confirmation: "demo123")

puts "1 user created"

AdminUser.create(email: "admin123@gmail.com", first_name: "admin", last_name: "admin", avatar: "Admin admin", password: "admin123", password_confirmation: "admin123")

puts "1 Admin user created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 Posts has been created"