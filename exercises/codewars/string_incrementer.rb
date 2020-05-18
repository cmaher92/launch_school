=begin
Your job is to write a function which increments a string, to create a new string.

If the string already ends with a number, the number should be incremented by 1.
If the string does not end with a number. the number 1 should be appended to the new string.
Examples:

foo -> foo1

foobar23 -> foobar24

foo0042 -> foo0043

foo9 -> foo10

foo099 -> foo100

Attention: If the number has leading zeros the amount of digits should be considered.
=end

# input:
#   - String
# output:
#   - String
# constraints:
#   - empty string should just return 1
#   - if string doesn't contain number, append to end
# test input/output
#   -
# algorithm/data structure:
#   - find digits at end of str
#     - iterate backwards
#     - break if char is not a digit
#   - find characters that aren't the ending digits
#     - if index of num_str is 0, str = ''
#     - otherwise str = 0...index of num_str

# def increment_string(str)
#   num_str = ''
#   str.reverse.each_char { |char| char.ord.between?(48, 57) ? num_str.insert(0, char) : break }
#   return str + '1' if num_str.empty?
#   str.index(num_str) == 0 ? str = '' : str = str[0...(str.index(num_str))]
#   str + num_str.succ
# end

def increment_string(str)
  if str[/\d\z/]
    str.sub(/(\d+)\z/) { $&.succ }
  else
    str + '1'
  end
end

p increment_string("foo") == "foo1"
p increment_string("foobar001") == "foobar002"
p increment_string("foobar1") == "foobar2"
p increment_string("foobar00") == "foobar01"
p increment_string("foobar99") == "foobar100"
p increment_string("") == "1"
p increment_string("1") == "2"
