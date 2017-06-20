source 'https://rubygems.org'

# Padrino supports Ruby version 1.9 and later
# ruby '2.3.1'

# Distribute your app as a gem
# gemspec

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'
gem 'rack-cors', :require => 'rack/cors'

# Component requirements
gem 'activerecord', '>= 3.1', :require => 'active_record'

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'activerecord-postgresql-adapter'
end

# Test requirements
gem 'rspec', :group => 'test'
gem 'rack-test', :require => 'rack/test', :group => 'test'

# Padrino Stable Gem
gem 'padrino', '0.14.1.1'

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.14.1.1'
# end
