# input:
#   str; word or phrase
# output:
#   str; translated word or phrase into pig-latin
# rules/constraints:
#   - if word begins in vowel sound
#     - return the word + 'ay'
#   - if word begin with consonant sound
#     - take the consonant(s) up to the first vowel, excluding the vowel
#     - remove from beginning of word, append to end of remaining word
#     - add 'ay'
# algorithm/data structure:
#   - SPLIT str into words
#   - FOR each word, map
#     - If word begins in consonant sound
#       - remove consanant sound
#       - append to end + 'ay'
#     - If word begins in vowel
#       - add 'ay'
require 'pry'

class PigLatin
  def self.translate(words)
    words.split(' ').map do |word|
      if begins_with_vowel_sound?(word)
        word + 'ay'
      else
        consonant_sound, rest_of_word = parse_for_consonant(word)
        rest_of_word + consonant_sound + 'ay'
      end
    end.join(' ')
  end

  def self.begins_with_vowel_sound?(word)
    word.match?(/\A(y[^aeiou]|x[^aeiou]|[aeiou])/)
  end

  def self.parse_for_consonant(word)
    # return the consonant sound and the rest of word as an array
    # isolate consonant sound
    consonant = word.match(/\A([^aeiou]*qu|[^aeiou]*ch|thr*|[^aeiou])/).to_s
    [consonant, word[consonant.size..-1]]
  end
end

# p PigLatin.translate('queen')
# p PigLatin.translate('pig')

# 'ch' consonant sound
# 'qu' consonant sound w/ vowel
# 'th' consonant sound
# 'thr' consonant sound
# 'sch' consonant sound
# 'ye' consonant sound w/ vowel
# 'yt' vowel sound
# 'xe' consonant sound w/ vowel
# 'xr' vowel sound
