source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5.1.4"
# Use Mongoid as our ODM (for MongoDB)
gem "mongoid", "~> 6.1.0"
# Use Puma as the app server
gem "puma", "~> 3.7"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Serializer
gem "active_model_serializers", "~> 0.10.0"
# Pagination
gem "kaminari"
gem "kaminari-mongoid"
# Use  Rubocop
gem "rubocop", require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "pry-byebug"
  gem "pry-rails"
  # Awesome print
  gem "awesome_print"
  # Rspec for rails
  gem "rspec-rails"
  # Parallel rspec tests
  gem "parallel_tests"
  # Guard for Rspec
  gem "guard-rspec", require: false
  # Rubocop for rspec
  gem "rubocop-rspec", require: false
  # travisCI
  gem "travis"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development,
  # by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  # Mongoid rspec
  gem "mongoid-rspec"
  # shoulda matcher
  gem "shoulda-matchers"
  # JSON schema matcher
  gem "json-schema"
  # Factory botc
  gem "factory_bot_rails"
  # Data faker
  gem "faker"
  # To clear test database between runs
  gem "database_cleaner"
  # SimpleCov
  gem "simplecov", require: false
  # Integration with Coveralls service for test metrics
  gem "coveralls", require: false
  # code climate
  gem "codeclimate-test-reporter", require: nil
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
