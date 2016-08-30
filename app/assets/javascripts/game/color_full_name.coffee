@color_full_name = (color) ->
  switch color
    when 'w' then 'white'
    when 'b' then 'black'
    when 'white' then color
    when 'black' then color
    when 'White' then 'white'
    when 'Black' then 'black'
