# You're working on a secret team solving coding transmissions

# Your team is scrambling to decipher a recent message,
# worried it's a plot to break into a major European
# National Bank Vault. The message has been mostly deciphered,
# but all the words are backward! Your colleagues have handed off the
# last step to you.

# Write a reverse_words!() method that takes a message as a string
# and reversed the order of the words in place. You cannot use the 
# split method, or the reverse method.

# input:
#   - String- message with all the words backwards
# output:
#   - String– reversed order of words
# constraints:
#   - you cannot use split or reverse method
# test input/output
#   -
# algorithm/data structure:
#   - reverse the order of the characters
#     - set two variables as begin, end set to 0 and the length of the message - 1
#     - while begin is less than end (loop)
#       - swap characters
#       - increment begin, decremement end
#   - reverse the order of the characters within the word
#     - find each word
#       - keep track of begin_word_index
#       - iterate until current character is a space or is the last character of the sentence
#       - if space
#         - call reverse_string! with message(begin_index, end_index-1)
#         - begin_index = end_index + 1
#         - end_index   = begin_index
#       - if last letter of string
#         - call reverse_string
#         - break
require 'pry'

def reverse_string!(message, begin_index, end_index)
  while begin_index < end_index
    message[begin_index], message[end_index] = message[end_index], message[begin_index]
    begin_index += 1
    end_index -= 1
  end
end

def reverse_words!(message, begin_index = 0)
  reverse_string!(message, 0, message.length - 1)

  begin_index, end_index = 0, 0
  while end_index < message.length
    end_index += 1
    # if end_index is a space
    # reverse from begin_index to end_index - 1
    if message[end_index] == ' '
      reverse_string!(message, begin_index, end_index-1)
      begin_index = end_index + 1
      end_index = begin_index
    elsif end_index == (message.length - 1)
      reverse_string!(message, begin_index, end_index)
    end
  end

end

message = 'cake pound steal'
reverse_words!(message)
puts message # 'steal pound cake'

message = 'cookies steals connor'
reverse_words!(message)
puts message
