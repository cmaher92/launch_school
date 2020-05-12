# You are given an array of English alphabets in normal alphabetic sequence. 
# The given array would have at least 2 characters. 
# However, there would be a missing letter in the sequence. Identify the missing letter in the array.

# input:
#   - array of letters from the alphabet in sequential order
# output:
#   - missing letter
# constraints:
#   - inputted array will consist of letters from the alphabet
# test input/output
#   -
# algorithm/data structure:
#   - create array from the first letter of given arr, to the last letter
#   - find difference between arrays

def missing_letter(arr)
  ((arr[0]..arr[-1]).to_a - arr).first
end

p missing_letter(['a', 'b', 'd']) == 'c'
p missing_letter(['o', 'p', 'q', 's']) == 'r'
p missing_letter(['A', 'C']) == 'B'
