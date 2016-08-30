# require 'piece_full_name'
class @MessageBox
  constructor: (@box) ->
  print: (message) -> @box.prepend('<p>' + message + '</p>')
  waiting: -> @print('Waiting for opponent...')
  clear: -> @box.html('')
  start: (color) -> @print("Game started! You play as #{color.capitalize()}")
  forfeit: -> @print('Opponent forfeits. You win!')
  draw: -> @print('Game Over! Match Draw!')
  check: (move) ->
    piece = piece_full_name(move.piece)
    color =  if /^w/.test(move.color) then 'White' else 'Black'
    @print("Check by #{color} #{piece}!")
  move: (move) ->
    piece = piece_full_name(move.piece)
    color =  if /^w/.test(move.color) then 'White' else 'Black'
    @print("#{color} moves #{piece} #{move.from.toUpperCase()} - #{move.to.toUpperCase()}")
