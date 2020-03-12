# Tip calculator

# Create a simple tip calculator. The program should prompt for a bill amount
# and a tip rate. The program must compute the tip and then display both the
# tip and the total amount of the bill.

# input
  # integer; bill amount
  # integer; tip percentage
# output
  # String; tip
  # String; total

def tip_calc(bill, tip)
  tip_and_total = []
  tip_and_total << (tip/100) * bill
  tip_and_total << (tip_and_total[0] + bill)
end

puts "What is the bill?"
bill = gets.chomp.to_i
puts "What is the tip percentage?"
tip = gets.chomp.to_f

tip_and_total = tip_calc(bill, tip)

puts "The tip is $#{tip_and_total[0]}"
puts "The total is $#{tip_and_total[1]}"

# Example:
# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0
