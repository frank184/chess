class @ChessButtons
  constructor: (@play_again, @forfeit) ->
  start: () ->
    this.play_again.hide()
    this.forfeit.show()
  over: () ->
    this.play_again.show()
    this.forfeit.hide()
