Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.read_encrypted_secrets = true
  config.public_file_server.enabled = true
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.log_level = :warn
  config.log_tags = [:request_id]
  config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false
  config.to_prepare { Devise::SessionsController.force_ssl }
end
