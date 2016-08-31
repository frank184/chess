@ChessBoardConfigurations =
  draggable: true
  onDragStart: (source, piece, position, orientation) ->
    turn_regex = new RegExp "^#{App.chess.turn()}"
    unless turn_regex.test(orientation) then false
    else
      if piece.search(turn_regex) == -1 then false
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
    App.highlighter.moves.hide()
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
  onMouseoverSquare: (square, piece, position, orientation) ->
    regex = new RegExp "^#{App.chess.turn()}"
    if regex.test(orientation)
      # get list of possible moves for this square
      moves = App.chess.moves
        square: square
        verbose: true
      App.highlighter.moves.show(square, moves)
  onMouseoutSquare: (square, piece, position, orientation) ->
    App.highlighter.moves.hide()
