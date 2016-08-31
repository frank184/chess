class @MovesHighlighter
  constructor: (@board) ->
  gray: (square) ->
    $square = @board.find('.square-' + square)
    background = if $square.hasClass('black-3c85d')
      '#696969'
    else
      '#a9a9a9'
    $square.css 'background', background
  show: (square, moves) ->
    # exit if there are no moves available for this square
    unless moves.length <= 0
      @gray(square)
      # highlight the possible squares for this piece
      i = 0
      while i < moves.length
        @gray(moves[i].to)
        i++
  hide: () ->
    @board.find('.square-55d63').css('background', '')
