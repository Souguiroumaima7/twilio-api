Rails.application.configure do 
config.cache_classes = false 
config.eager_load = false 
config.eager_load = false 
config.public_file_server.enabled =true
config.public_file_server.headers = {
  'cache-control' => "public ,max-age =#{1.hour.io_i}"
}
config.consider_all_requests_local = true 
config.action_controller.perform_caching = false 
config.action_controller.allow_forgery_protection = false 
config.action_mailer.perform_caching = false 
config.action_mailer.delivery_method = :test 
config.active_support.deprecation = :stderr 
end 
