class @Highlighter
  constructor: (@board) ->
  color: (color) ->
    switch color
      when 'w' then 'white'
      when 'b' then 'black'
      else color
  start: (options) ->
    from = options['from']
    color = @color(options['color'])
    @board.find('.square-' + from).addClass('highlight-' + color)
  drag: (options) ->
    from = options['from']
    newTo = options['newTo']
    oldTo = options['oldTo']
    color = @color(options['color'])
    $newTo = @board.find('.square-' + newTo)
    $oldTo = @board.find('.square-' + oldTo)
    unless ($newTo.hasClass('move'))
      @board.find('.square-' + newTo).addClass('highlight-' + color)
    unless (from == oldTo || $oldTo.hasClass('move'))
      @board.find('.square-' + oldTo).removeClass('highlight-' + color)
  move: (options) ->
    from = options['from']
    to = options['to']
    color = @color(options['color'])
    @board.find('.highlight-' + color + '.move').removeClass('highlight-' + color + ' move')
    @board.find('.square-' + from + ', ' + '.square-' + to).addClass('highlight-' + color + ' move')
    console.log('Calling App.highlighter.move')
  remove: (options) ->
    from = options['from']
    to = options['to']
    color = @color(options['color'])
    $from = @board.find('.square-' + from)
    unless ($from.hasClass('move'))
      $from.removeClass('highlight-' + color)
    @board.find('.square-' + to).removeClass('highlight-' + color)
