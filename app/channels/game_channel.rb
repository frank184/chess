# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "player_#{uuid}"
    Game::Engine.search(uuid)
  end

  def unsubscribed
    Game::Engine.forfeit(uuid)
  end

  def move(move)
    Game::Engine.move(uuid, move)
  end

  def check(move)
    Game::Engine.check(uuid, move)
  end

  def checkmate
    Game::Engine.checkmate(uuid)
  end

  def draw
    Game::Engine.draw(uuid)
  end
end
