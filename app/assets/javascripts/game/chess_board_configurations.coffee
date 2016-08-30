@ChessBoardConfigurations =
  draggable: true
  onDragStart: (source, piece, position, orientation) ->
    switch orientation
      when 'white'
        if (/^b/.test(App.chess.turn())) then false
        else if (piece.search(/^w/) == -1) then false
      when 'black'
        if (piece.search(/^b/) == -1) then false
        else if (/^w/.test(App.chess.turn())) then false
  onDrop: (source, target, piece, newPos, oldPos, orientation) ->
    move = App.chess.move
      from: source
      to: target
      promotion: "q"
    if (move == null) then "snapback"
    else
      App.game.perform("move", move)
      if (App.chess.in_check())
        App.game.perform("check", move)
      else if (App.chess.game_over())
        if (App.chess.in_checkmate())
          App.game.perform("checkmate")
        else if (App.chess.in_draw())
          App.game.perform("draw")
