# Bannerizer
# Write a method that will take a short line of text, and print it within a box.
require 'pry'

def split_message(message)
  line_count = (message.length / 76.0).ceil
  lines = []
  words = message.split(' ')
  # iterate over lines
  # append words to the line, unless by shifting the word will make the length > 76
    # if line + word is greater than 76, break
    # else, line + word
  line = ''
  loop do
    if words.empty?
      lines << line
      break
    end
    if (line.length + words[0].length + 1) > 76
      lines << line
      line = ''
    end
    line.empty? ? line << words.shift : line << " #{words.shift}"
  end
  lines
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