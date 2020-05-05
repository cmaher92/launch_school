# Now I know my ABCs
# Medium 2, problem 2

# A collection of spelling blocks has two letters per block, as shown in this list:

# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# This limits the words you can spell with the blocks to just those words that do not 
# use both letters from any given block. Each block can only be used once.

# Write a method that returns true if the word passed in as an argument can be spelled 
# from this set of blocks, false otherwise.

# < string
# > boolean
# ! only can use one letter from pair of letters
# ! case insensitive
# Algorithm
# Create array of subbarrays containing letters
# Find the index of the letter_block for each letter
#   - for each letter, check if letter is in the array
require 'pry'

LETTER_BLOCKS = %W(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

# def block_word?(str)
#   indices = []
#   str.split(//).each do |letter|
#     LETTER_BLOCKS.each_with_index do |block, idx|
#       indices << idx if block.include?(letter.upcase)
#     end
#   end

def block_word?(str)
  # upcase the word
  # check each letter block, if the count is > 1, return false
  # return true
  str = str.upcase
  LETTER_BLOCKS.each do |block|
    return false if str.count(block) > 1
  end
  true
end

#   indices.size == indices.uniq.size
# end

# Examples:
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
