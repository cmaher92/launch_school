# For a given positive integer convert it into its English representation. 
# All words are lower case and are separated with one space. No trailing spaces are allowed.

# To keep it simple, hyphens and the writing of the word 'and' both aren't enforced. 
# (But if you are looking for some extra challenge, such an output will pass the tests.)

# Large number reference: http://en.wikipedia.org/wiki/Names_of_large_numbers 
# (U.S., Canada and modern British)

# Input range: 1 -> 10**26 (10**16 for JS)

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

# input
#   - integer: positive
# output
#   - string: english representation of given integer
# constraints
#   - input is positive
#   - all words in output should be lower case and are separated by one space
#   - no trailing spaces
#   - dashes between 
# approach
# create constants holding suffixes and a hash map that will be responsiblle
# for mapping each integer number to their corresponding english word. 
# Seperate the number into groups of three by using division, keeping track
# of both the quotient and the modulus. The modulus will be added the 
# number groups array, and this process will repeat until the quotient is 0.
# Now map each grouping into the integer to string hashing map, adding suffixes
# based on the index position of each grouping. Once the maping is completed along
# with the proper suffixes being appended, reverse the list into it's proper order and join
# it together. 
# steps
# - create constant for mapping integers to english words
# - create a constant holding suffixes of numbers numbers beginning with thousands
# - write a method definition that takes an integer argument
# - set a variable result to hold a list of strings
# - separate number into groupings of three numbers
# - map groupings of numbers into their english words
# - set a variable to 0 to have access to the suffixes constant while looping
#   - repeat process until number is equal to 0
#     - find the quotient and modulus of the number by 1000
#     - the quotient should be reassigned to the number
#     - the modulus result shoud be assigned to variable called hundred
#       - 123456.divmod(1000) -> 123, 456
#     - find the quotient and modulus of the number by 100
#       - assign quotient to hundred
#       - assign modulus to tens
#     - check to see if the hundreds is 0
#       - if it is, hundreds = ""
#       - if it isn't, map it through the constant and append ' hundred'
#     - check to see if tens is between 10..19
#       - if it is, map through the ones  constant
#       - if not, find quotient and modulus by 10
#         - assign variables to tens
#         - map each through corresponding constants
#         - join together with a space
#     - combine hundreds + tens + suffix
#     - reject any variables that have empty strings
#     - incremement idx variable
#     - prepend to list
# - join list together

# int_to_english(0) == ""
# int_to_english(10) == "ten"
# int_to_english(100) == "one hundred"
# int_to_english(132) ==  "one hundred thirty two"

def int_to_english(n)
  result = []
  idx     = 0
  
  until n == 0 do
    n, hundreds = n.divmod(1000)
    hundreds, tens = hundreds.divmod(100)
    
    if hundreds == 0
      hundreds = ""
    else
      hundreds = ONES[hundreds] + ' hundred'
    end
    
    if tens.between?(10, 19)
      tens = ONES[tens]
    elsif tens == 0
      tens = ""
    else
      tens, ones = tens.divmod(10)
      tens = TENS[tens]
      tens = "" if tens.nil?
      ones = ONES[ones]
      ones = "" if ones.nil?
      tens = [tens, ones].reject { |place| place.empty? }.join(' ')
    end
    group = [hundreds, tens, SUFFIXES[idx]].reject { |place| place.empty? }.join(' ')
    result.prepend(group)
    idx += 1
  end
  
  result.join(' ')
end

# Examples:
p int_to_english(0)
p int_to_english(1) #== 'one'
p int_to_english(10) #== 'ten'
p int_to_english(25161045656) #== 'twenty five billion one hundred sixty one million forty five thousand six hundred fifty six'
# int_to_english(25161045656) == 'twenty five billion one hundred sixty-one million forty-five thousand six hundred and fifty-six'

