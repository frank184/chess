@piece_full_name = (piece) ->
  switch piece
    when 'p' then 'Pawn'
    when 'r' then 'Rook'
    when 'n' then 'Knight'
    when 'b' then 'Bishop'
    when 'q' then 'Queen'
    when 'k' then 'King'
