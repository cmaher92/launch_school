# Write a program that requests two integers from the user,
# adds them together, and then displays the result.
# Furthermore, insist that one of the integers be positive,
# and one negative; however, the order in which the two integers are
# entered does not matter.
#
# Do not check for the positive/negative requirement
# until both integers are entered, and start over if the requirement is not met.
#
# You may use the following method to validate input integers:

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def one_pos_one_neg?(num, num_2)
  # return true if one is negative and one is positive
  # return false otherwise
  num = num.to_i
  num_2 = num_2.to_i
  return true if num > 0 && num_2 < 0
  return true if num < 0 && num_2 > 0
  false
end

def ask_for_num()
  num = ""
  loop do
    puts ">> Please enter a positive or negative integer:"
    num = gets.chomp
    break if valid_number?(num)
    puts "Invalid input. Only non-zero integers are allowed."
  end
  num
end

num = ""
num_2 = ""

loop do

  num = ask_for_num()
  num_2 = ask_for_num()

  # break if one is negative, and one is positive
  break if one_pos_one_neg?(num, num_2)
  puts ">> Sorry. One integer must be positive, one must be negative."
  puts ">> Please start over."

end

puts "#{num} + #{num_2} = #{num.to_i + num_2.to_i}"



# $ ruby opposites.rb
# >> Please enter a positive or negative integer:
# 8
# >> Please enter a positive or negative integer:
# 0
# >> Invalid input. Only non-zero integers are allowed.
# >> Please enter a positive or negative integer:
# -5
# 8 + -5 = 3
