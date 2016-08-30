# Instatiate Parts of the Game on Document Ready
$ ->
  # Instantiate MessageBox object
  App.messages = new MessageBox $(messages)
  # Instantiate Chess Rules object : https://github.com/jhlywa/chess.js
  App.chess = new Chess()
  # Instatiate ChessBoard object : https://github.com/oakmac/chessboardjs
  App.board = new ChessBoard('chessboard', ChessBoardConfigurations)
  # Instantiate ChessButtons object
  App.buttons = new ChessButtons $(play_again), $(forfeit)
