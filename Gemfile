source 'http://rubygems.org'
ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = '#{repo_name}/#{repo_name}' unless repo_name.include?('/')
  'https://github.com/#{repo_name}.git'
end
gem 'active_admin_flat_skin'
gem 'activeadmin', '~> 1.2'
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap-kaminari-views'
gem 'bootstrap-sass', '3.3.7'
gem 'carrierwave'
gem 'coffee-rails', '~> 4.2'
gem 'config'
gem 'devise'
gem 'haml'
gem 'jquery-rails'
gem 'kaminari'
gem 'letter_opener', :group => :development
gem 'mini_magick'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.6'
gem 'ransack'
gem 'rubocop', '~> 0.46.0', require: false
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'faker'

#gem 'bullet', group: :development

group :development, :test do
  gem 'rspec-rails'
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara'
  gem 'fabrication'
  gem 'rails-controller-testing'
end

group :development do
  gem 'mysql2', '>= 0.3.18', '< 0.6.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 3.1'
end

group :production do
  gem "pg"
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
