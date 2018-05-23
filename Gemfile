source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem "bcrypt", "~> 3.1.7"
gem "bootstrap-kaminari-views" 
gem "bootstrap-sass", "3.3.7"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "devise"
gem "haml"
gem "jquery-rails"
gem "kaminari"       
gem "letter_opener", :group => :development
gem "mysql2", ">= 0.3.18", "< 0.6.0"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.6"
gem "ransack"     
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "rubocop", "~> 0.46.0", require: false

group :development, :test do
  gem "fabrication"
  gem "faker"
  gem "capybara"
  gem "rails-controller-testing"
	gem "rspec-rails"
	gem "simplecov", :require => false
	gem "simplecov-rcov", :require => false
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "shoulda-matchers", "~> 3.1"
  gem "database_cleaner"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
