require 'redis'
url = Rails.application.config_for("redis/cable")['url']
encoded_url = URI.encode(url)
uri = URI.parse(encoded_url)
REDIS = Redis.new(host: uri.host, port: uri.port, password: uri.password)
# REDIS = Redis.new(Rails.application.config_for("redis/cable"))
