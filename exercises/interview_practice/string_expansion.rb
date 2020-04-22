# Simple Simple Simple String Expansion | 6 kyu

# Given a string that includes alphanumeric characters ('3a4B2d') return the expansion of that string: 
# The numeric values represent the occurrence of each letter preceding that numeric value. 
# There should be no numeric characters in the final string. Empty strings should return an empty string.
# The first occurrence of a numeric value should be the number of times each character 
# behind it is repeated, until the next numeric value appears.

# < String
# > String
# ! the numeric values represent the occurrence of each letter after the numeric value
# ! there should be no numeric characters in the final string
# ! only numeric characters that precede letter character should be used
# ! case insensitive
# ! empty string return emptty str
# &

# '3d332f2a' # => 'dddffaa'
# find numeric characters,
#   - keep track of last number (convert it to an integer)
#   - iterate through the string
#     - if current character is a letter
#       - if there is no preceding number, simply append to the result string, 
#       - otherwise multiply by last number and append
#     - if current character is a number
#       - reassign last_num to current number
# return the result string

# def string_expansion(str)
#   result = ''
#   last_num = nil
#   str.each_char do |char|
#     if char.match?(/[a-z]/i)                          # if it's a letter
#       result << char if last_num == nil               # append to result string if no number precedes
#       result << (char * last_num) if last_num != nil  # multiply letter by preceding number then append
#     else
#       last_num = char.to_i
#     end
#   end
#   result
# end

# with gsub
# find numeric characters followed by at least one letter character and place into an array
  # use scan with the pattern /\d*[a-z]+/i
# check each substring for a leading numeric character
  # if there isn't, just return substring
# if the first character within the substring is numeric (str[0].to_i != 0)
  # remove the numeric character
  # convert to integer
  # iterate over remaining part of the substring mapping each character to itself multiplied by number
  # combine to result together, without the number

def string_expansion(str)
  substrs = str.scan(/\d{0,1}[a-z]+/i)
  substrs.map do |substr|
    if substr[0].to_i == 0
      substr
    else
      num = substr.slice!(0).to_i
      substr = substr.chars.map { |char| char * num }.join
      substr
    end
  end.join
end

p string_expansion('3D2a5d2f') == 'DDDaadddddff'
p string_expansion('3abc')     == 'aaabbbccc'
p string_expansion('3d332f2a') == 'dddffaa'
p string_expansion('abcde')    == 'abcde'
p string_expansion('')         == ''