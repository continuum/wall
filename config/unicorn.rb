env = ENV["RAILS_ENV"] || ENV["RACK_ENV"]
if env == "development"
  worker_processes 1
else
  worker_processes 3
end
timeout 30
preload_app true

before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
    Rails.logger.info('Disconnected from ActiveRecord')
  end

  if defined?(Resque)
    Resque.redis.quit
    Rails.logger.info('Disconnected from Redis')
  end

  sleep 1
end

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
    Rails.logger.info('Connected to ActiveRecord')
  end

  if defined?(Resque)
    Resque.redis = ENV["OPENREDIS_URL"]
    Rails.logger.info('Connected to Redis')
  end
end