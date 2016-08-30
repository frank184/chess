@ChessBoardConfigurations =
  draggable: true
  onDragStart: (source, piece, position, orientation) ->
    switch orientation
      when 'white'
        if (/^b/.test(App.chess.turn())) then false
        else if (piece.search(/^w/) == -1) then false
        else
          App.highlighter.start
            from: source
            color: orientation
      when 'black'
        if (piece.search(/^b/) == -1) then false
        else if (/^w/.test(App.chess.turn())) then false
        else
          App.highlighter.start
            from: source
            color: orientation
  onDragMove: (newTo, oldTo, source, piece, position, orientation) ->
    App.highlighter.drag
      from: source
      newTo: newTo
      oldTo: oldTo
      color: orientation
  onDrop: (source, target, piece, newPos, oldPos, orientation) ->
    move = App.chess.move
      from: source
      to: target
      promotion: "q"
    if (move == null)
      App.highlighter.remove
        from: source
        to: target
        color: orientation
      "snapback"
    else
      App.game.perform("move", move)
      if (App.chess.game_over())
        if (App.chess.in_checkmate())
          App.game.perform("checkmate")
        else if (App.chess.in_draw())
          App.game.perform("draw")
      else if (App.chess.in_check())
        App.game.perform("check", move)
