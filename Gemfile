source "https://rubygems.org"

gem "rails", "~> 8.0.1"
gem "propshaft"
gem "sqlite3", ">= 2.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "devise"

gem "solid_cache"
gem "solid_queue"
gem "solid_queue_dashboard"
gem "solid_cable"
gem "frozen_record"
gem "responders"

# must be kept in-sync with vendor/gems version until engine support https://github.com/rails/tailwindcss-rails/pull/484
gem "atomic_view", "0.0.4"
gem "view_component-form", github: "joelzwarrington/view_component-form", branch: "without-autoload"

gem "tailwindcss-rails"
gem "tailwind_merge"
gem "heroicons"

gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false

  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end
