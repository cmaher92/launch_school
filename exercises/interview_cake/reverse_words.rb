# You're working on a secret team solving coding transmissions

# Your team is scrambling to decipher a recent message,
# worried it's a plot to break into a major European
# National Bank Vault. The message has been mostly deciphered,
# but all the words are backward! Your colleagues have handed off the
# last step to you.

# Write a reverse_words!() method that takes a message as a string
# and reversed the order of the words in place. You cannot use the 
# split method, or the reverse method.

# solution
# 1. Reverse all characters in the entire message
#     - giving us the correct word order but each word is backwards
# 2. Reverse the characters in each individual string

require 'pry'

  def reverse_words!(message)

  # First we reverse all the characters in the entire message.
  reverse_characters!(message, 0, message.length - 1)

  # This gives us the right word order
  # but with each word backward.

  # Now we'll make the words forward again
  # by reversing each word's characters.

  # We hold the index of the *start* of the current word
  # as we look for the *end* of the current word.
  current_word_start_index = 0

  (0..message.length).each do |i|

    # Skip unless we're at the end of the current word.
    next unless i == message.length || message[i] == ' '

    reverse_characters!(message, current_word_start_index, i - 1)

    # If we haven't exhausted the string our
    # next word's start is one character ahead.
    current_word_start_index = i + 1
  end
end

def reverse_characters!(message, left_index, right_index)

  # Walk towards the middle, from both sides.
  while left_index < right_index

    # Swap the left char and right char.
    message[left_index], message[right_index] =
      message[right_index], message[left_index]

    left_index  += 1
    right_index -= 1
  end
end

# message = 'cake pound steal'
# reverse_words!(message)
# puts message # 'steal pound cake'
name = 'connor maher'
reverse_str!(name[0..5])
p name