class @ChessButtons
  constructor: (@play_again, @forfeit) ->
  start: () ->
    this.forfeit.show()
  over: () ->
    this.play_again.show()
    this.forfeit.hide()
