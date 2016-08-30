App.game = App.cable.subscriptions.create "GameChannel",
  connected: ->
    App.messages.waiting()

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    switch data.action
      when "start"
        App.messages.clear()
        App.messages.start(data.color)
        App.buttons.start()
        App.board.start()
        App.board.orientation(data.color)
      when "move"
        App.messages.move(data.move)
        App.board.move(data.move.from + '-' + data.move.to)
        App.chess.move
          from: data.move.from
          to: data.move.to
          promotion: "q"
      when "opponent_forfeits"
        App.messages.forfeit()
        App.buttons.over()
      when "checkmate"
        App.messages.print "Checkmate! You #{data.status}!"
        App.buttons.over()
      when "check"
        App.messages.check(data.move)
      when "draw"
        App.messages.draw()
        App.buttons.over()
