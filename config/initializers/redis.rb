# Initialize the Redis connection
redis = Redis.new(url: ENV['REDIS_URL'] || 'redis://localhost:6379/15')

# Wrap the Redis instance with a namespace
$redis = Redis::Namespace.new(Rails.env, redis:)
