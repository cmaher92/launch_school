# word to digit
# medium_1, problem 7

# < String
# > String
# ! Convert number_words to numbers
# & 
#   convert all words that represent numbers to numbers
#     - init a hash that maps words that represents number to numbers (both strings)
#     - split words on spaces
#     - transform words within the sentence
#       - scan the word, 
#       - return the number character if the word is present as a key
#     - combine back into a sentence and return

WORD_TO_DIGITS = { 'one' => '1', 'two' => '2', 'three' => '3', 
                   'four' => '4', 'five' => '5', 'six' => '6', 
                   'seven' => '7', 'eight' => '8', 'nine' => '9',
                   'zero' => '0'
               }

def word_to_digit(sentence)
  sentence.split.map do |word|
    stripped_word = word.gsub(/[^a-z]/i, '').downcase
    if WORD_TO_DIGITS.keys.include?(stripped_word)
      new_word = WORD_TO_DIGITS[stripped_word]
      word[-1].match?(/[a-z]/i) ? new_word : new_word + word[-1]
    else
      word
    end
  end.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'