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
#   - create a list of suffix
#   - create an array to store the subarrays of numbers
# - create a list of subarrays of three numbers
#   - divide the inputted number by 1000
#   - placing the remainder into an array then appending to subarray to the numbers array
#  - convert each subarray of numbers to their english words
#     - divide by 100, if the remainder is between 10..19 map to ones
#     - otherwise, divide original number by 10 and map to english word
#       - if it's 0, ignore it
#     - once the result is less than 10
#       - map to ones and append 'hundred'
# - append appropriate suffix (thousand, millionm billion etc..)
# algorithm
# - convert each subarray of numbers to their english words
#   - number is at maximum 3 digits
#   - set local variable to an empty string
#   - divmod by 100
#   - map the quotient to the ones constants
#     - if q isn't zero
#     - add to the string
#     - add space to string
#   - if modulus is between 1..19
#     - map to ones
#     - add to english_numbers string 
#   - else
#     - divmod by 10, mapping the one to the ONES constant and the TEN to the TENS constant
#     - concat and add to english_numbers array

require 'pry'

ONES = {
  0 => '',
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen',
}

TENS = {
  2 => 'twenty',
  3 => 'thirty',
  4 => 'forty',
  5 => 'fifty',
  6 => 'sixty',
  7 => 'seventy',
  8 => 'eighty',
  9 => 'ninety'
}

SUFFIXES = ['', 'thousand', 'million', 'billion', 'trillion', 'quadrillion', 'quintillion', 'sextillion', 'septillion']

def int_to_english(n)
  numbers = []
  quotient = n
  modulus = 0
  until quotient == 0
    quotient, modulus = quotient.divmod(1000)
    numbers << modulus
  end
  
  numbers.map! do |number|
    english = []
    q, r = number.divmod(100)
    english << (ONES[q] + ' hundred') if q != 0
    if r.between?(10,19)
      english << ONES[r]
    else
      ten, one = r.divmod(10)
      english << TENS[ten]
      english << ONES[one]
    end
    english.select { |number| number }.join(' ')
  end
  
  numbers.map.with_index do |n, idx| 
    if SUFFIXES[idx].empty?
      n
    else
      n + " #{SUFFIXES[idx]}"
    end
  end.reverse.join(' ')
end

# Examples:
p int_to_english(1) == 'one'
p int_to_english(10) == 'ten'
p int_to_english(25161045656) == 'twenty five billion one hundred sixty one million forty five thousand six hundred fifty six'
# int_to_english(25161045656) == 'twenty five billion one hundred sixty-one million forty-five thousand six hundred and fifty-six'

