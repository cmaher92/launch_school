# Convert a String to a Number

# input
#   String of numbers
# output
#   Integer, numbers from the above String
# rules
#   don't use #to_i
#   don't use Integer constructor method
#   don't worry about sign
#   assume all characters will be numeric

# data structure
#   Array of integers
# algorithm
#   split the string into individual characters
#   map each character to it's Integer using a str_to_int constant
#   reverse the mapped array and map again
#     multiple the value by the multiplier variable
#     multiply the multiply value * 10 for each item
#   sum the mapped array and return

def string_to_integer(num_str)
  str_to_int = (0..9).map { |i| [i.to_s, i] }.to_h
  
  mult = 1
  num_str.chars.map { |char| str_to_int[char] }.reverse.map { |i| i *= mult; mult *= 10; i}.sum
end
  

# p string_to_integer('4321') #== 4321
# p string_to_integer('570') #== 570