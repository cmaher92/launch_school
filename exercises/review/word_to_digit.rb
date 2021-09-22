require 'minitest/autorun'
require 'pry'

# input
# - string containing numbers written out in word-form
# output
# - string containing numbers in numeric-form

# alogo
# - parse string for word numbers
#   - split sentence into words
#   - check each word to see if it contains matches a number
#       - five -> true
#       - six. -> true
# - replace each word that is a number with it's numeric-form
#   - iterate over each word
#   - if it is a number
#       - replace it with it's numeric-form
#   - if not
#       - return word
# - return new string
DIGIT_HASH = {
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9',
  'zero' => '0'
}

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end

class PracticeProblemTest < Minitest::Test
  def test_cases
    expected = 'Please call me at 5 5 5 1 2 3 4. Thanks.'
    assert_equal(expected, word_to_digit('Please call me at five five five one two three four. Thanks.'))
  end
end