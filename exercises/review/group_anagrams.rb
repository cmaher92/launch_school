# group_anagrams.rb

# IO
# < words (array) [string..]
# > anagrams (array) [[anagram...]...]

# RULES
# anagrams are words that have the same exact letters in them but in different
# order

# ALGORITHM
# 1. initialize a new hash named anagrams { word => [str...] }
# 2. FOR each word
#    - break into chars, sort and save as sorted
#    - IF anagrams has sorted
#      - append unsorted word to anagrams's associated value for sorted
#    - IF it doesn't
#      - add sorted to anagrams with array containing unsorted word
def find_anagrams(words)
  anagrams = {}

  words.each do |unsorted|
    sorted = unsorted.chars.sort.join
    if anagrams[sorted]
      anagrams[sorted] << unsorted
    else
      anagrams[sorted] = [unsorted]
    end
  end

  anagrams.values
end


# EXAMPLES
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
p find_anagrams(words)
