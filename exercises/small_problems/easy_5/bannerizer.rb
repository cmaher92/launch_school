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


def print_in_box(str)
  str.length < 76 ? less_than_limit(str) : more_than_limit(str)
end

def more_than_limit(str)
  length = 76
  puts "+#{"-" * (length + 2)}+"
  puts "|#{" " * (length + 2)}|"
  line_printer(str)
  puts "|#{" " * (length + 2)}|"
  puts "+#{"-" * (length + 2)}+"
end

def less_than_limit(str)
  puts "+#{"-" * (str.length + 2)}+"
  puts "|#{" " * (str.length + 2)}|"
  puts "| #{str} |"
  puts "|#{" " * (str.length + 2)}|"
  puts "+#{"-" * (str.length + 2)}+"
end

def line_printer(str)
  line = ""
  idx  = 0
  arr = str.split()
  while idx < arr.length
    if arr[idx].length + line.length > 76
      line = "| #{line}|"
      if line.length != 80
        line.insert(-2,"#{" " * (80 - line.length)}")
        puts line
      else
        puts line
      end
      line = "#{arr[idx]} "
      idx += 1
    end
    line << "#{arr[idx]} "
    idx += 1
  end
  line = "| #{line}|"
  if line.length != 80
    line.insert(-2,"#{" " * (80 - line.length)}")
    puts line
  else
    puts line
  end
end


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
