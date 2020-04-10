# Bannerizer
# Write a method that will take a short line of text, and print it within a box.

# further exploring
# split_string method
# split the sentence into words
# x = 0
# loop, break when x == words.size
# y = 0
#   loop
#     increment y by 1
#     if the length of words[x, y].join(' ') > 76
#       join words[x, y-1] and append to messages array
#       x = y
#       break

def split_message(message)
  words = message.split(' ')
  second = []
  # pop words and append to second string, until first string is less than 76 |
  loop do
    second.unshift(words.pop)
    break if words.join(' ').length <= 76
  end
  [words.join(' '), second.join(' ')]
end

def print_middle_lines(messages)
  length = messages[0].length
  puts "| #{messages[0]} |"
  puts "| #{messages[1].center(length)} |"
end

def print_in_box(message)
  if message.length > 76
    messages = split_message(message)
  else
    messages = [message]
  end
  outer_line = "+#{'-' * (messages[0].size + 2)}+"
  empty_line = "|#{' ' * (messages[0].size + 2)}|"

  puts outer_line
  puts empty_line
  print_middle_lines(messages)
  puts empty_line
  puts outer_line
end

print_in_box('connor maher lives in cotuit massachusetts which is on cape cod and it is a very very nice town you will have to see it')

# Example:
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