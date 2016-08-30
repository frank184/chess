module Game
  class Engine
    def self.search(uuid)
      if opponent = Seek.find
        start(uuid, opponent)
      else
        Seek.add(uuid)
      end
    end

    def self.opponent_for(uuid)
      REDIS.get("opponent_for:#{uuid}")
    end

    def self.over(uuid1, uuid2)
      REDIS.del("opponent_for:#{uuid1}")
      REDIS.del("opponent_for:#{uuid2}")
      Seek.remove(uuid1)
      Seek.remove(uuid2)
    end

    def self.start(uuid1, uuid2)
      white, black = [uuid1, uuid2].shuffle
      ActionCable.server.broadcast "player_#{white}", {action: "start", color: "white"}
      ActionCable.server.broadcast "player_#{black}", {action: "start", color: "black"}
      REDIS.set("opponent_for:#{white}", black)
      REDIS.set("opponent_for:#{black}", white)
    end

    def self.move(uuid, move)
      opponent = opponent_for(uuid)
      ActionCable.server.broadcast "player_#{uuid}", {action: "move", move: move}
      ActionCable.server.broadcast "player_#{opponent}", {action: "move", move: move}
    end

    def self.check(uuid, move)
      opponent = opponent_for(uuid)
      ActionCable.server.broadcast "player_#{uuid}", {action: "check", move: move}
      ActionCable.server.broadcast "player_#{opponent}", {action: "check", move: move}
    end

    def self.checkmate(uuid)
      winner, loser = [uuid, opponent_for(uuid)]
      ActionCable.server.broadcast "player_#{winner}", {action: "checkmate", status: 'win'}
      ActionCable.server.broadcast "player_#{loser}", {action: "checkmate", status: 'lose'}
      over(winner, loser)
    end

    def self.forfeit(uuid)
      winner, loser = [opponent_for(uuid), uuid]
      ActionCable.server.broadcast "player_#{winner}", {action: "opponent_forfeits"}
      over(winner, loser)
    end

    def self.draw(uuid)
      opponent = opponent_for(uuid)
      ActionCable.server.broadcast "player_#{uuid}", {action: "draw"}
      ActionCable.server.broadcast "player_#{opponent}", {action: "draw"}
      over(uuid, opponent)
    end
  end
end
