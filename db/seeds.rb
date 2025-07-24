# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# メインのサンプルユーザー
User.find_or_create_by!(email: "example@railstutorial.org") do |user|
  user.name                  = "Example User"
  user.password              = "foobarrr"
  user.password_confirmation = "foobarrr"
  user.admin                 = true
  user.activated             = true
  user.activated_at          = Time.zone.now
end

# 追加ユーザー
99.times do |n|
  email = "example-#{n+1}@railstutorial.org"
  User.find_or_create_by!(email: email) do |user|
    user.name                  = Faker::Name.name
    user.password              = "password"
    user.password_confirmation = "password"
    user.activated             = true
    user.activated_at          = Time.zone.now
  end
end

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.find_or_create_by(content: content) }
end
