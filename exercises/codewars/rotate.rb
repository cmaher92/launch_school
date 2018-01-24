def rot(string)
    arr = string.split(/\\n/)
    arr = arr.reverse
    arr.map! { |substr| substr.reverse }
    arr.join('\n')
end

def selfie_and_rot(string)
  # create a local variable passing the string to the rot function
  # take the first string and split it on the newline character
  # map each substr append 4 periods
  # repeat for rotated string but the dots are prepended
  # join them with \n character
  # concated initial + \n + substr
  rot_string = rot(string)
  arr = string.split(/\n/)
  arr.map! { |substr| "#{substr}...." }
  str = arr.join("\n")
  rot_arr = rot_string.split(/\n/)
  rot_arr.map! { |substr| "....#{substr}" }
  rot_str = rot_arr.join("\n")
  "#{str}\n#{rot_str}"
end

def method(symbol)
  if symbol == :rot
    return Proc.new { |s| rot(s) }
  else
    return Proc.new { |s| selfie_and_rot(s) }
  end
end

def oper(fct, s)
  fct.call(s)
end

# method function
# given a symbol
# return a proc object based on the symbol

# given n lines, each substring being n chars long
# s = "abcd\nefgh\nijkl\nmnop"
# after rot is called
# s = "mnop\nijkl\nefgh\nabcd"

# rot function
# take the string which contains newline characters
# split the string on the newline characters which outputs an array
# reverse the order of the array
# for each subarr in the reversed array
  # reverse the order
# join the reversed array into a string containing \n characters as seperators

# selfie_and_rot function
# input
#   initial string, and string obtained by clock rotation of 180 (rot func)
# output
#   string that contains the first string concatenated with the rotated string
#   in between the concatinated strings is the a newline character

# take the first string and split it on the newline character
# map each substr append 4 periods
# repeat for rotated string but the dots are prepended
# join them with \n character
# concated initial + \n + substr

# oper function
# input
#   symbol defines whether or not to call rot or selfie_and_rot
# output
#   string based on if rot or selfie_and_rot is called
