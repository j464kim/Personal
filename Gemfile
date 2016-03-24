source 'https://rubygems.org'
ruby '2.2.1'

gem 'rails', '4.2.5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bootstrap-sass'
gem 'devise', '~> 3.5.3'
gem 'paperclip', '~> 4.2'
gem 'aws-sdk', '< 2.0'
#creating a group means we are only using database
#called 'sqlite3' when in test case
#:development means on our computer
group :development, :test do
	gem 'sqlite3' #data_base that comes with Rails 
end

group :production do
	gem 'pg'
	gem 'rails_12factor'
end

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
end


#requires $bundle install