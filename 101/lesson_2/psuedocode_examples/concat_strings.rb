

# Given an array of strings

# set a variable to hold the concatenated string
# iterate over the array
# append the current string to the concatenated string

# return the concatenated string


# START
#
# SET concat_string = ""
# WHILE iterating collection of strings
#   SET concat_string += iterator
#
# PRINT concat_string
#
# END

def concat_array(array)

  concat_string = ""
  array.each do |string|
    concat_string << string
  end

  return concat_string

end

puts concat_array(%w(hey how are you))
