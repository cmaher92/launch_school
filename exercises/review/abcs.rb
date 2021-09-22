# now i know my abcs
# set: small problems/med 2
# date: 09/22/21

require 'pry'
require 'minitest/autorun'

# rules:
# - cannot use a word that has two letters from single 'block'
# - each 'block' can only be used once
# - spelling-blocks:
#   - B:O
#   - X:K
#   - D:Q
#   - C:P
#   - N:A
#   - G:T
#   - R:E
#   - F:S
#   - J:W
#   - H:U
#   - V:I
#   - L:Y
#   - Z:M

# input:
# - string: word

# output:
# - boolean: whether or not the 'word' can be spelled from this set of blocks

# examples:
# 'BATCH' --> true
# - Uses blocks 'B:O', 'N:A', 'G:T', 'C:P', 'H:U'

# 'BUTCH' --> false
# - Invalid because 'H:U' block was used for the 'U', so cannot be used again for 'H'

# 'jest' --> true
# - Uses blocks 'J:W', 'R:E', 'F:S', 'G:T'

# algorithm
# - create an array representing the spelling blocks
#   - each element is an array representing the block
#   - [['B', 'O'], ...]
# - check each character within string to see if block has been used or not
#   - if current char is present within blocks
#       - valid
#       - remove block from available blocks
#   - if char is not present
#       - return false
# - after all letters have been checked and false has not be returned return true

def block_available?(blocks, char)
    # check if block is currently available in block array
    # handle regardless of case
    blocks.flatten.include?(char.upcase)
end

def remove_block(blocks, char)
    blocks.reject { |block| block.include?(char.upcase) }
end

def block_word?(word)
    blocks = [%w(B O), %w(G T), %w(V I), %w(X K), %w(R E), %w(L Y), %w(D Q),
              %w(F S), %w(Z M), %w(C P), %w(J W), %w(N A), %w(H U)]
    
    word.each_char do |char|
        if block_available?(blocks, char)
            blocks = remove_block(blocks, char)
        else
            return false
        end
    end

    true
end

class Test < Minitest::Test
    def setup
        @blocks = [%w(B O), %w(G T), %w(V I), %w(X K), %w(R E), %w(L Y), %w(D Q),
                   %w(F S), %w(Z M), %w(C P), %w(J W), %w(N A), %w(H U)]
    end
    
    def test_block_available
        assert block_available?(@blocks, 'b')
        assert block_available?(@blocks, 'B')
        refute block_available?([%w(F S), %w(B O)], "!")
    end

    def test_remove_block
        refute_includes(remove_block(@blocks, 'B'), ['B', 'O'])
        refute_includes(remove_block(@blocks, 'b'), ['B', 'O'])
        refute_includes(remove_block(@blocks, 'O'), ['B', 'O'])
        refute_includes(remove_block(@blocks, 'o'), ['B', 'O'])
    end

    def test_block_word
        assert block_word?('BATCH')
        refute block_word?('BUTCH')
        assert block_word?('jest')
    end

end