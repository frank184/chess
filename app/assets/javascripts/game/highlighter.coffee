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
    @board.find('.square-' + newTo).addClass('highlight-' + color)
    unless (from == oldTo)
      @board.find('.square-' + oldTo).removeClass('highlight-' + color)
  move: (options) ->
    from = options['from']
    to = options['to']
    color = @color(options['color'])
    @board.find('.square-55d63').removeClass('highlight-' + color)
    @board.find('.square-' + from + ', ' + '.square-' + to).addClass('highlight-' + color)
  remove: (options) ->
    from = options['from']
    to = options['to']
    color = @color(options['color'])
    @board.find('.square-' + from + ', ' + '.square-' + to).removeClass('highlight-' + color);
