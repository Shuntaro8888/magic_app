#!/usr/bin/env bash
# exit on error
set -o errexit
bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

# 他のセッションを強制終了（安全にリセットするため）
bundle exec rails runner "ActiveRecord::Base.connection.execute(%{
  SELECT pg_terminate_backend(pid)
  FROM pg_stat_activity
  WHERE datname = '#{ActiveRecord::Base.connection.current_database}'
    AND pid <> pg_backend_pid();
})"

# 強制的にDBを再作成（練習用だからOK）
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:drop
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed