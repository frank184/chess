require 'redis'
# url = Rails.application.config_for("redis/cable")['url']
# encoded_url = URI.encode(url)
# uri = URI.parse(encoded_url)
# REDIS = Redis.new(host: uri.host, port: uri.port, password: uri.password)
REDIS = Redis.new(Rails.application.config_for("redis/cable"))

# Test
puts "\n" * 10
REDIS.set("hello", "hello")
puts REDIS.get("hello")
REDIS.del("hello")
puts "\n" * 10
