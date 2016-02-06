Rails.application.configure do



  config.cache_classes = false

  config.eager_load = false

  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_mailer.raise_delivery_errors = false

  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load

  config.assets.debug = true

  config.assets.digest = true

  config.assets.raise_runtime_errors = true

  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # Paperclip config:
  # this fixes the problem when creating a new pin with image uploaded
  Paperclip.options[:image_magick_path] = "/opt/ImageMagick/bin"
  Paperclip.options[:command_path] = "/opt/ImageMagick/bin"
end
