# Bannerizer
#
# Write a method that will take a short line of text, and print it within a box.
#
# Example:
#
# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+
# You may assume that the input will always fit in your terminal window.


# input
#   string
# output
#   multiple strings that create a box based on the string length
  
# given a string retrieve the length of the string
#   print the first line which would be anchored on both ends by '+' signs
#     and 4 chars longer than the length of the given string
#   print the second line which should be be 4 chars longer than the string also
#     anchored on both ends but by '|' chars
#   print the third line which contains the string, also anchored on both ends, and a space between the string and the anchors
#   print the second line again
#   print the first line again 

# Now try to provide a string with 80 or more chars, adjust the function to
# handle this edge-case


# if the str is equal to or greater then 80 chars
# split the string onto multiple lines
# then 

def print_in_box(str)
  arr = split_lines(str)
  length = arr.sort[0].length
  top_border    = "++"
  inside_lines  = "||"
  top_border.insert(1, ("-" * (length + 2)))
  inside_lines.insert(1, " " * (length + 2))
  
  puts top_border
  puts inside_lines
  arr.each do |s|
    puts "| #{s} |"
  end
  puts inside_lines
  puts top_border
end

def split_lines(str)
  if str.length < 80
    return [str]
  else
    [str.slice(0, (str.length/2)).strip, str.slice(str.length/2, str.length - 1).strip]
  end
end

# how can I improve this solution?
# turn the string into an array
#   concat each string in the array into a line to be printed
#   once the line + current_string's length is above 80
#   print the line 
#   set line to be printed to the current string


print_in_box('To boldly go where no one has gone before.')
print_in_box("The quick brown fox jumped over the lazy dog The quick brown fox jumped over the lazy dog The quick brown fox jumped over the lazy dog The quick brown fox jumped over the lazy dog")











# Solution
#
# def print_in_box(message)
#    horizontal_rule = "+#{'-' * (message.size + 2)}+"
#    empty_line = "|#{' ' * (message.size + 2)}|"
#
#    puts horizontal_rule
#    puts empty_line
#    puts "| #{message} |"
#    puts empty_line
#    puts horizontal_rule
# end
# Discussion
#
# This is a fairly straight forward solution To simplify matters, 
# we start out by setting horizontal_rule and empty_line to appropriate 
# values for the top and bottom 2 lines of the box. 
# The expression '-' * (message.size + 2) simply creates a string of 
# message.size + 2 hyphens; combined with the + at the beginning and 
# end of the the string, this is just wide enough to draw the horizontal 
# lines while leaving room for one blank on either side of the message.
#
# Further Exploration
#
# Modify this method so it will truncate the message if it will be too wide to 
# fit inside a standard terminal window (80 columns, including the sides of the box). 
# For a real challenge, try word wrapping very long messages so they appear on 
# multiple lines, but still within a box.
