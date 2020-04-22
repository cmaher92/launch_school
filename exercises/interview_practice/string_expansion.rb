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
# ! empty string return emptty str
# &
# split the string from numeric value to the following strings
  # 3d, 2a, 5d, 2f
  # 3abc
# split the numeric value from the letters
  # [3, d], [2, a], [5, d]
  # [3 a b c]
#   - split all the chars within the subarrs
# expand out subarray
#   - shift the number off the front of the subarr
#   - map each character within the remaining subarr, multiplying char
#   - join together

def string_expansion(str)
  return str if str.include?(1..9)
  # str.scan(/\d[a-z]+/i)
end

def string_expansion(str)
  numbers = (1..9).to_a
  current_num = 1
  results = ''
  
  str.chars.each do |char|
    if numbers.include?(char.to_i)
      current_num = char.to_i
    else
      results << (char * current_num)
    end
  end
  results
end


p string_expansion('3D2a5d2f') == 'DDDaadddddff'
p string_expansion('3abc') #== 'aaabbbccc'       # correct
p string_expansion('3d332f2a') #== 'dddffaa'
p string_expansion('abcde') #== 'abcde'
# p string_expansion('') #== ''