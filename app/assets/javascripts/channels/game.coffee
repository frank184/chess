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
        App.chess.move
          from: data.move.from
          to: data.move.to
          promotion: "q"
        App.highlighter.move
          from: data.move.from
          to: data.move.to
          color: data.move.color
        App.board.position(App.chess.fen())
      when "forfeit"
        current_turn_color = color_full_name(App.chess.turn())
        App.highlighter.over()
        App.messages.forfeit()
        App.buttons.over()
      when "checkmate"
        App.highlighter.over()
        App.messages.print "Checkmate! You #{data.status}!"
        App.buttons.over()
      when "check"
        App.messages.check(data.move)
      when "draw"
        App.highlighter.over()
        App.messages.draw()
        App.buttons.over()
