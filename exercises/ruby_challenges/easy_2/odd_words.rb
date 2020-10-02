# odd words
# by: Connor Maher

# input: String
#   - one or more words
#   - seperated by >= 1 space(s)
#   - terminated by >= 0 spaces followed by a '.'
# output:
#   - odd words are reversed
#   - words are separated by a single space
#   - terminated by a single point
# rules/constraints:
#   - words consist of 1..20 letters
# algorithm/data structure:
#   - parse the str into an array of words
#     - split on spaces
#   - reverse the odd indexed words
#   - join the str separated by a single space and a period
str1 = 'whats the matter with kansas.'
str2 = 'whats  the  matter  with kansas  .'
str3 = ''
str4 = '   '
str5 = '.'
str6 = 'connormichaelmaherisawesome hi'

def split_on_spaces(str)
  str.scan(/\w{1,20}/)
end

# p split_on_spaces(str1)
# p split_on_spaces(str2)
# p split_on_spaces(str3)
# p split_on_spaces(str4)

def odd_words(str)
  words = split_on_spaces(str)
  new_str = words.each_with_index.map do |word, i|
    i.odd? ? word.reverse : word
  end.join(' ')
  new_str += '.' if !new_str.empty? && str[-1] == '.'
  new_str
end

p odd_words(str1)
p odd_words(str2)
p odd_words(str3)
p odd_words(str4)
p odd_words(str5)
p odd_words(str6)
