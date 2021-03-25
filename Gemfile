source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'jwt'
gem 'fast_jsonapi'

gem 'sidekiq', '~> 6.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
