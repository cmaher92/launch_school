# Typoglycemia generator

# Return a string where
# 1. the first and lest characters remain in original place for each word
# 2. characters between first and last are sorted alphabetically
# 3. puncutation should remain at the same place as it started shan't -> sahn't

# Assumptions
# 1. words are separated by single spaces
# 2. only spaces separate words
# 3. punctuation limited to (-, ', comma, period)
# 4. ignore caps

# < string
# > string
# ! words separated by single spaces
# ! punctuation within words will be , . - '
# ! ignore caps

# split word on spaces if contains spaces
# scramble word
# - find the number of letters within the word
# - iterate over each letter
# - if this is the first letter seen, leave it
#   - if it's a letter and the count of letters seen is 0
# - if this is the last letter seen, leave it
#   - if it's a letter and the count of letters seen is one less than total
# - if this is not a letter, leave it
# - otherwise we know it's a middle-letter so add it to the middle-letter string and replace with an empty string
# sort the middle_letters
# replace all empty strings shifting middle_letters
# return word

def scramble_words(words)
  words.split.map do |word|
    scramble_word(word)
  end.join(' ')
end

# def scramble_word(word)
#   letter_count   = word.count("a-z")
#   letters_seen   = 0
#   middle_letters = []
  
#   word = word.chars
#   word.map! do |char|
#     if char.match?(/[a-z]/i)
#       if letters_seen == 0 || letters_seen == letter_count - 1
#         letters_seen += 1
#         char
#       else
#         letters_seen += 1
#         middle_letters << char
#         ''
#       end
#     else
#       char
#     end
#   end

#   middle_letters.sort!

#   word.map! do |char|
#     char == '' ? middle_letters.shift : char
#   end.join
# end

def scramble_words(words)
  words.split(' ').map { |word| scramble(word) }.join(' ')
end

def scramble(word)
  chars = word.chars
  letters = chars.select { |char| letter?(char) }
  scrambled_letters = scramble_letters(letters.join).chars
  chars.map do |char|
    letter?(char) ? scrambled_letters.shift : char
  end
    .join
end

def scramble_letters(word)
  return word if word.length <= 2
  
  word[0] + word[1...-1].chars.sort.join + word[-1]
end

def letter?(char)
  char.match? /[a-z]/
end


# tests
p scramble_words('professionals') # 'paefilnoorsss'
# p scramble_words('professionals') == 'paefilnoorsss'
# p scramble_words('i') == 'i'
# p scramble_words('') == ''
# p scramble_words('me') == 'me'
# p scramble_words('card-carrying') == 'caac-dinrrryg'
# p scramble_words("shan't") == "sahn't"
# p scramble_words('dcba.') == 'dbca.'
# p scramble_words('-dcba') == '-dbca'
