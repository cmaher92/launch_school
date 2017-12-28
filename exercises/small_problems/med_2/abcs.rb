# Now I Know My ABCs
# A collection of spelling blocks has two letters per block, as shown in this
# list:
#
# B:O   X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M
# This limits the words you can spell with the blocks to just those words that
# do not use both letters from any given block. Each block can only be used once.
#
# Write a method that returns true if the word passed in as an argument can be
# spelled from this set of blocks, false otherwise.

CHECK_LETTERS = ['BO',
                 'XK',
                 'DQ',
                 'CP',
                 'NA',
                 'GT',
                 'RE',
                 'FS',
                 'JW',
                 'HU',
                 'VI',
                 'LY',
                 'ZM']

# input
#   string - the word to check
# output
#   boolean - whether or not the word used the same block
# rules
#   do not use the same letters within the same subarr
#   each block can only be used once

# given a string
# initialize a local variable that points to an array
# split the string into an array
# map over the array of characters
#   return the index in CHECK_LETTERS for the given character
# compare the arr to the arr#uniq

# require 'pry'
#
# def block_word?(str)
#   arr = str.upcase.split(//).map do |char|
#     CHECK_LETTERS.index do |substr|
#       substr[0] == char || substr[1] == char
#     end
#   end
#   arr == arr.uniq
# end


BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
  # none? passes each item of BLOCK into the block
  # .count then checks the string up_string to see if the string contains
  # more than 1 string in any of the blocks, if it does it would return
  # true for that check which would cause #none? to return false.
  # If there isn't any item in BLOCKS that up_string contains more than 1
  # of then it will return true. 
end


# Examples:
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
