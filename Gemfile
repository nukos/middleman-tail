# If you do not have OpenSSL installed, change
# the following line to use 'http://'
source 'https://rubygems.org'

# Environment
ENV['NOKOGIRI_USE_SYSTEM_LIBRARIES'] = 'YES'
gem 'nokogiri', '1.6.8.1'

# Markup
gem 'redcarpet', '~> 3.3', '>= 3.3.3'
gem 'slim'

# For s3_sync
gem 'mime-types'
gem 'aws-sdk-v1'

# Middleman Gems
gem 'middleman', '>= 4.0.0'
gem 'middleman-livereload'
gem "middleman-blog"
gem "middleman-syntax"
gem "middleman-minify-html"
gem 'middleman-ogp'
gem 'middleman-s3_sync'

# For feed.xml.builder
gem "builder", "~> 3.0"

# For faster file watcher updates on Windows:
gem 'wdm', '~> 0.1.0', platforms: [:mswin, :mingw]

# Windows does not come with time zone data
gem 'tzinfo-data', platforms: [:mswin, :mingw, :jruby]
