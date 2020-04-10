# Bannerizer
# Write a method that will take a short line of text, and print it within a box.

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