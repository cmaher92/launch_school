# ddaaiillyy ddoouubbllee

# Write a method that takes a string argument and returns a new string that 
# contains the value of the original string with all consecutive duplicate 
# characters collapsed into a single character. You may not use String#squeeze
# or String#squeeze!.

# input
#   string 
# output
#   string all consecutive duplicate chars collapsed
# rules
#   no squeeze 
  
# given a string 
# remove any consecutive chars that are duplicate
# covert string to array
#   iterate over the arr comparing the current element with the previous
#   if the previous is the same as the current remove the previous
#   set previous to current and continue iteration
#   otherwise if the previous is different
#   set current to previous 

  
def crunch(str)  
  arr = str.split(//)
  nxt = 0
  arr.select! do |char|
    nxt += 1
    char != arr[nxt]
  end
  arr.join
end

# Test cases:
puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
