# For a given positive integer convert it into its English representation. 
# All words are lower case and are separated with one space. No trailing spaces are allowed.

# To keep it simple, hyphens and the writing of the word 'and' both aren't enforced. 
# (But if you are looking for some extra challenge, such an output will pass the tests.)

# Large number reference: http://en.wikipedia.org/wiki/Names_of_large_numbers 
# (U.S., Canada and modern British)

# Input range: 1 -> 10**26 (10**16 for JS)

# input
#   - integer: positive
# output
#   - string: english representation of given integer
# constraints
#   - input is positive
#   - all words in output should be lower case and are separated by one space
#   - no trailing spaces
#   - dashes between 
# mental model 
# - create a map for integer to english word
#    - 0-19
#    - twenty
#    - thirty
#   - fourty
#   - fifty
#   - sixty
#   - seventy
#   - eighty
#   - ninety
# algorithm
#   - create array with english representation of powers of ten
#   - find english representation of 1-99
#   - divmod by 10, map remainder to ONES constant
#   - divmod by 10 again, map remainder to 

ONES = {
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine'
}

TENS = {
  2 => 'twenty',
  3 => 'thirty',
  4 => 'fourty',
  5 => 'fifty',
  6 => 'sixty',
  7 => 'seventy',
  8 => 'eighty',
  9 => 'ninety'
}

# Examples:
int_to_english(1) == 'one'
int_to_english(10) == 'ten'
int_to_english(25161045656) == 'twenty five billion one hundred sixty one million forty five thousand six hundred fifty six'
int_to_english(25161045656) == 'twenty five billion one hundred sixty-one million forty-five thousand six hundred and fifty-six'