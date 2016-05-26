Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  config.cache_classes = true

  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?

  config.assets.js_compressor = :uglifier
  config.assets.compile = false

  config.assets.digest = true

  config.log_level = :debug

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new

  config.active_record.dump_schema_after_migration = false

  config.action_mailer.default_url_options = { host: 'jun-gwon.com' }

  config.assets.initialize_on_precompile = true
  # THIS SOLVES STYLESHEET PROBLEM!!
  config.cache_classes = true
  config.serve_static_assets = true
  config.assets.compile = true
  config.assets.digest = true

  Bundler.require(*Rails.groups(assets: %w(development test production)))
  # Paperclip config:
  # this fixes the problem when creating a new pin with image uploaded

  Paperclip.options[:image_magick_path] = "/opt/ImageMagick/bin"
  Paperclip.options[:command_path] = "/opt/ImageMagick/bin"

  #Sets Paperclip to upload images to Amazon S3
  config.paperclip_defaults = {
    storage: :s3,
    s3_credentials: {
      bucket: ENV.fetch('S3_BUCKET_NAME'),
      access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
      s3_region: ENV.fetch('AWS_REGION'),
    }
  }
end
