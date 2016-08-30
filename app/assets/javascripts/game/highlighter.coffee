class @Highlighter
  constructor: (@board) ->
  start: (options) ->
    from = options['from']
    color = color_full_name(options['color'])
    @board.find('.square-' + from).addClass('highlight-' + color)
  drag: (options) ->
    from = options['from']
    newTo = options['newTo']
    oldTo = options['oldTo']
    color = color_full_name(options['color'])
    $newTo = @board.find('.square-' + newTo)
    $oldTo = @board.find('.square-' + oldTo)
    unless ($newTo.hasClass('last-move'))
      @board.find('.square-' + newTo).addClass('highlight-' + color)
    unless (from == oldTo || $oldTo.hasClass('last-move'))
      @board.find('.square-' + oldTo).removeClass('highlight-' + color)
  move: (options) ->
    from = options['from']
    to = options['to']
    color = color_full_name(options['color'])
    @board.find('.highlight-' + color + '.last-move').removeClass('highlight-' + color + ' last-move')
    @board.find('.square-' + from + ', ' + '.square-' + to).addClass('highlight-' + color + ' last-move')
  remove: (options) ->
    from = options['from']
    to = options['to']
    color = color_full_name(options['color'])
    $from = @board.find('.square-' + from)
    unless ($from.hasClass('last-move'))
      $from.removeClass('highlight-' + color)
    @board.find('.square-' + to).removeClass('highlight-' + color)
