source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~>3.2"

gem "rails",           "7.0.4.3"
gem "image_processing", "1.12.2"
gem "active_storage_validations", "0.9.8"
gem "bcrypt",          "3.1.18"
gem "faker",           "2.21.0"
gem "will_paginate",           "3.3.1"
gem "bootstrap-will_paginate", "1.0.0"
gem "bootstrap-sass",  "3.4.1"
gem "sassc-rails",     "2.1.2"
gem "sprockets-rails", "3.4.2"
gem "importmap-rails", "1.1.5"
gem "turbo-rails",     "1.4.0"
gem "stimulus-rails",  "1.2.1"
gem "jbuilder",        "2.11.5"
gem "puma",            "5.6.8"
gem "bootsnap",        "1.16.0", require: false
gem "sqlite3",         "1.6.1"
gem "concurrent-ruby", "1.3.4"

group :development, :test do
  #gem 'reline', '0.5.10'
  gem 'reline', '0.4.0'
  gem "debug",   "1.7.1", platforms: %i[ mri mingw x64_mingw ] # Ruby 3.1以降ではデフォルトで有効
  #gem 'byebug', '11.1.3', platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console",         "4.2.0"
  gem "solargraph",          "0.53.4"
  gem "irb",                 "1.10.0"
  gem "repl_type_completor", "0.1.9"
end

group :test do
  gem "capybara",                 "3.38.0"
  gem "selenium-webdriver",       "4.8.3"
  gem "webdrivers",               "5.2.0"
  gem "rails-controller-testing", "1.0.5"
  gem "minitest",                 "5.18.0"
  gem "minitest-reporters",       "1.6.0"
  gem "guard",                    "2.18.0"
  gem "guard-minitest",           "2.4.6"
end

group :production do
  gem "pg", "1.3.5" # PostgreSQLを使用する場合
  # gem "mysql2", "0.5.3" # MySQLを使用する場合
  gem "aws-sdk-s3", "1.114.0", require: false # Active StorageでS3を使用する場合
end

# Windows ではタイムゾーン情報用の tzinfo-data gem を含める必要があります
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
# gem 'prism', '>=0.19.0'
gem 'mutex_m'
gem 'bigdecimal'
gem 'drb'
gem 'fiddle'
gem 'ruby_llm' # Ruby LLMを使用するためのgem
gem 'harry_potter_faker' # Harry Potterのキャラの名前を生成するためのgem