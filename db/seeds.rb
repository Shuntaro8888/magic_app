# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# メインのサンプルユーザー
User.find_or_create_by!(email: 'example@railstutorial.org') do |user|
  user.name                  = 'ハリーポッター'
  user.password              = 'foobarrr'
  user.password_confirmation = 'foobarrr'
  user.admin                 = true
  user.activated             = true
  user.activated_at          = Time.zone.now
end

# 追加ユーザー
Faker::Config.locale = 'ja' # Fakerのロケールを日本語に設定
99.times do |n|
  email = "example-#{n + 1}@railstutorial.org"
  User.find_or_create_by!(email: email) do |user|
    user.name                  = Faker::Movies::HarryPotter.character[0..49] # Harry Potterの名前を使用
    user.password              = 'password'
    user.password_confirmation = 'password'
    user.activated             = true
    user.activated_at          = Time.zone.now
  end
end

# ユーザーの一部を対象にマイクロポストを生成する
users = User.order(:created_at).take(5)
5.times do
  users.each do |user|
    content = Faker::Movies::HarryPotter.quote[0..139] # Harry Potterのセリフを生成
    # ユーザーにマイクロポストを作成
    user.microposts.find_or_create_by(content: content)
  end
end

# ユーザーの一部を対象にフォロー関係を生成する
users = User.all
user = users.first # 最初のユーザーを基準にする
following = users[2..50] # 最初の2人を除くユーザー
followers = users[3..40] # 最初の3人を除くユーザー
following.each { |followed| user.follow(followed) } # ユーザーが他のユーザーをフォロー
followers.each { |follower| follower.follow(user) } # ユーザーがフォロワーを持つ
