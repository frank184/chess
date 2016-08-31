# require 'color_full_name'
class @Highlighter
  constructor: (@board) ->
    @moves = new MovesHighlighter(@board)
  square: (name) ->
    "square-#{name}"
  highlight: (color) ->
    "highlight-#{color}"
  start: (options) ->
    from = options['from']
    color = color_full_name(options['color'])
    @board.find('.square-' + from).addClass('highlight-' + color)
  drag: (options) ->
    from = options['from']
    newTo = options['newTo']
    oldTo = options['oldTo']
    color = color_full_name(options['color'])
    $newTo = @board.find(".#{@square(newTo)}")
    $oldTo = @board.find(".#{@square(oldTo)}")
    unless $newTo.hasClass('last-move') then $newTo.addClass('highlight-' + color)
    unless $oldTo.hasClass('last-move') then $oldTo.removeClass('highlight-' + color)
  move: (options) ->
    from = options['from']
    to = options['to']
    color = color_full_name(options['color'])
    opponent = opponent_color_full_name(color)
    # Find existing last moves for this player
    @board.find('.highlight-' + color + '.last-move').removeClass('highlight-' + color + ' last-move')
    # Highlight moves and add last-move class
    $from = @board.find('.square-' + from)
    $to = @board.find('.square-' + to)
    $from.addClass('highlight-' + color + ' last-move')
    $to.addClass('highlight-' + color + ' last-move')
    if $to.hasClass('highlight-' + opponent) then $to.removeClass('highlight-' + opponent)
  remove: (options) ->
    from = options['from']
    to = options['to']
    color = color_full_name(options['color'])
    $from = @board.find('.square-' + from)
    $to = @board.find('.square-' + to)
    unless $from.hasClass('last-move') then $from.removeClass('highlight-' + color)
    unless $to.hasClass('last-move') then $to.removeClass('highlight-' + color)
