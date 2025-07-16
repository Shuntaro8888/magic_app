#!/usr/bin/env bash
# exit on error
set -o errexit
bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean

# 他の接続をkill（psqlコマンドが使えれば）
psql "${DATABASE_URL}?sslmode=require" -c \
  "SELECT pg_terminate_backend(pid) \
   FROM pg_stat_activity \
   WHERE datname = current_database() AND pid <> pg_backend_pid();"

DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:drop db:create db:migrate db:seed

# bundle exec rails db:migrate
# DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:migrate:reset
# bundle exec rails db:seed

# renderでデプロイ失敗するので `reset` はやめて、明示的に drop → create → migrate → seed
# DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:drop
# bundle exec rails db:create
# bundle exec rails db:migrate
# bundle exec rails db:seed