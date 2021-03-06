# Write a method that returns all of the fields in a haphazardly formatted string.
# The fields are separated by a variety of spaces, tabs, and commas,
# with possibly multiple occurrences of these characters.

# def fields(str)
#   str.scan(/\b\w\w*\b/)
# end

def fields(str)
  str.split(/[ ,\t]+/)
end

# Examples:
p fields("Pete,201,Student")
# -> ['Pete', '201', 'Student']

p fields("Pete \t 201    ,  TA")
# -> ['Pete', '201', 'TA']

p fields("Pete \t 201")
# -> ['Pete', '201']
