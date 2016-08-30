module Game
  class Seek
    def self.find
      REDIS.spop("seeks")
    end

    def self.add(uuid)
      REDIS.sadd("seeks", uuid)
    end

    def self.remove(uuid)
      REDIS.srem("seeks", uuid)
    end
  end
end
