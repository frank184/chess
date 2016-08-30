String::capitalize = -> @charAt(0).toUpperCase() + @slice(1)

String::titleize = ->
  string_array = @split(' ')
  string_array = string_array.map((str) -> str.capitalize())
  string_array.join ' '
