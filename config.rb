Time.zone = "Asia/Tokyo"

###
# Settings
###
set :site_url,         'http://example.com/'
set :site_name,        'middleman-tail'
set :site_title,       'middleman-tail static web site'
set :site_description, 'middleman-tail is the Skeleton to create a blog that uses a middleman 4.'
set :site_author,      'Ryuichi Nonaka'

set :http_prefix,      '/'
set :index_file,       'index.html'
set :relative_links,   false
set :strip_index_file, true
set :trailing_slash,   true
# set :layout,         'layout'
# set :source,         'source'

# set :build_dir,      'build'
# set :data_dir,       'data'
set :layouts_dir,    'layouts'
# set :helpers_dir,    'helpers'
# set :css_dir,        'stylesheets'
# set :js_dir,         'javascripts'
# set :fonts_dir,      'fonts'
# set :images_dir,     'images'


###
# OGP Settings
###
activate :ogp do |ogp|
  ogp.namespaces = {
    og: data.ogp.og,
    fb: data.ogp.fb,
    twitter: data.ogp.twitter
  }
  ogp.base_url = config[:site_url]
  ogp.blog = true
end


###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }


###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end


###
# Markup Setting
###

# slim setting
set :slim, {
  :pretty => true,
  :sort_attrs => false,
  :format => :html
}
Slim::Engine.disable_option_validator!

# markdown setting
set :markdown_engine, :redcarpet
set :markdown, {
  :fenced_code_blocks => true,
  :smartypants => true,
  :with_toc_data => false,
  :tables => true,
  :autolink => true,
  :gh_blockcode => true,
  :footnotes => true,
  :strikethrough => true
}

# middleman-syntax setting
activate :syntax, {
  :line_numbers => true
}

###
# middleman-blog setting
###

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"
  # blog.permalink = "{year}/{month}/{day}/{title}.html"

  # Matcher for blog source files
  blog.sources = "articles/{year}/{month}/{day}-{title}.html"

  # blog.taglink = "tags/{tag}.html"
  blog.layout = "post"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  blog.default_extension = ".md"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"
  blog.new_article_template = "article.tt"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end


###
# External Pipeline
###

activate :external_pipeline,
  name:    :gulp,
  command: build? ? 'gulp build' : 'gulp server',
  source:  ".tmp/dest",
  latency: 0.25


###
# Environment
###

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload, :no_swf => true
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css
  # Minify Javascript on build
  activate :minify_javascript
  # Minify HTML on build
  activate :minify_html
  activate :asset_hash

  # ignore
  ignore /assets\/stylesheets\/.*\.scss/
  ignore /assets\/javascripts\/(?!bundle).*\.js/
end

########################
# S3sync Setting
########################
# activate :s3_sync do |s3_sync|

#   # Profile name
#   profile_name = 'default'

#   # Get credential
#   credential = AWS::Core::CredentialProviders::
#                 SharedCredentialFileProvider
#                 .new(profile_name: profile_name)
#                 .get_credentials

#   # S3Sync config
#   s3_sync.bucket                     = 'middleman4'
#   s3_sync.region                     = 'ap-northeast-1'
#   s3_sync.aws_access_key_id          = credential[:access_key_id]
#   s3_sync.aws_secret_access_key      = credential[:secret_access_key]
#   s3_sync.delete                     = true
#   s3_sync.after_build                = false
#   s3_sync.prefer_gzip                = true
#   s3_sync.path_style                 = true
#   s3_sync.reduced_redundancy_storage = false
#   s3_sync.acl                        = 'public-read'
#   s3_sync.encryption                 = false
#   s3_sync.prefix                     = ''
#   s3_sync.version_bucket             = false
#   s3_sync.index_document             = 'index.html'
#   s3_sync.error_document             = '404.html'
# end

# ########################
# #
# # Caching policy
# #
# ########################
# caching_policy 'text/html', cache_control: {max_age: 3600, must_revalidate: true}, content_encoding: 'gzip'
# caching_policy 'image/png', cache_control: {max_age: 31536000, public: true}, content_encoding: 'gzip'
# caching_policy 'image/jpeg', cache_control: {max_age: 31536000, public: true}, content_encoding: 'gzip'
# caching_policy 'text/css', cache_control: {max_age: 31536000, public: true}, content_encoding: 'gzip'
# caching_policy 'application/javascript', cache_control: {max_age: 31536000, public: true}, content_encoding: 'gzip'