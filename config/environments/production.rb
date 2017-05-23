Rails.application.configure do
  config.action_controller.perform_caching = true
  config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = false
  config.active_record.dump_schema_after_migration = false
  config.active_support.deprecation = :notify
  config.assets.compile = false
  config.assets.js_compressor = :uglifier
  config.cache_classes = true
  config.consider_all_requests_local = false
  config.force_ssl = true
  config.eager_load = true
  config.i18n.fallbacks = true
  config.log_formatter = ::Logger::Formatter.new
  config.log_level = :warn
  config.log_tags = [:request_id]
  config.public_file_server.enabled = true
  config.read_encrypted_secrets = true
  config.ssl_options = {redirect: {exclude: ->(request) { request.path =~ /healthcheck/ }}}
end
