#!/bin/sh

git checkout -t origin/2.3-stable
cat > config/database.yml << EOF
development:
  adapter: sqlite3
  database: db/development.sqlite3
EOF
bundle install --path vendor/bundle --without test postgresql mysql rmagick

rake generate_secret_token
rake db:migrate

mkdir public/plugin_assets
chmod -R 755 files log tmp public/plugin_assets
