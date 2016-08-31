@color_full_name = (color) ->
  switch color
    when 'w' then 'white'
    when 'b' then 'black'
    when 'white' then color
    when 'black' then color
    when 'White' then 'white'
    when 'Black' then 'black'
@opponent_color_full_name = (color) ->
  switch color
    when 'w' then 'black'
    when 'b' then 'white'
    when 'white' then 'black'
    when 'black' then 'white'
    when 'White' then 'black'
    when 'Black' then 'white'
@color_short_hand = (color) ->
  switch color
    when 'w' then color
    when 'b' then color
    when 'white' then 'w'
    when 'black' then 'b'
    when 'White' then 'w'
    when 'Black' then 'b'
@opponent_color_short_hand = (color) ->
  switch color
    when 'w' then 'b'
    when 'b' then 'w'
    when 'white' then 'b'
    when 'black' then 'w'
    when 'White' then 'b'
    when 'Black' then 'w'
