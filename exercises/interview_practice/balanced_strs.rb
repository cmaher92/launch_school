# Balanced strings are those who have equal quantify of 'L' and 'R' characters.
# Given a balanced string 's' split it in the maximum amont of balanced strings.
# Return the maximum amount of split balanced strings.

# Input: String
# Output: Integer
# Rules:
#   - split string into maximum amount of balanced strings
#   - 'RLRRLLRLRL' => ['RL', 'RRLL', 'RL', 'RL']
#   - 'LLLLRRRR' =>   ['LLLLRRRR']
#   - order doesn't matter
# Algo:
#   build a balanced string from argument str
#     - init balance_str
#     - count = 0
#     - iterate over string
#       - append first string to balanced string
#       - increment count
#       - if next string is same character,
require 'pry'

def balanced_string_split(str)
  binding.pry
  rs = str.scan(/R+/).sort
  ls = str.scan(/L+/).sort
  rs.zip(ls).map { |e| e.join  }
end

# p balanced_string_split("RLRRLLRLRL") #== 4
# p balanced_string_split("RLLLLRRRLR") #== 3
# p balanced_string_split("LLLLRRRR")   #== 1
p balanced_string_split("RLRRRLLRLL") #== 2

 # def balanced_string_split(str)
 #   max_count = 0
 #   r_count = 0
 #   l_count = 0
   
 #   str.chars.each do |letter|
 #     letter == "R" ? r_count += 1 : l_count += 1
 #     if r_count == l_count
 #       max_count += 1
 #       r_count, l_count = 0, 0
 #     end
 #   end
 #  max_count
 # end