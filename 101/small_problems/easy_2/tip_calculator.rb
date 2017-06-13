# Tip calculator

# Create a simple tip calculator. The program should prompt for a bill amount 
# and a tip rate. The program must compute the tip and then display both the tip 
# and the total amount of the bill.

# Understanding the problem
# Input
#   user-input: asks for the bill amount and tip rate
# Output
#   print tip amount and total bill amount

# algorithm
# calculate the tip rate in decimal form
#   take the tip rate, convert to float, divide by 100.0
# calculate the tip
#   take the bill amount and multiply it by the tip rate in decimal form
# calculate the total
#   take the bill amount and add it to the tip amount

def tip_calculator
    puts "What is the bill?"
    bill_amount = gets.chomp.to_f
    
    puts "What is the tip percentage?"
    tip_percentage = gets.chomp.to_i
    
    tip_rate = tip_percentage / 100.0
    tip      = (ill_amount * tip_rate).round(2)
    total    = tip + bill_amount
    
    puts "The tip is $#{tip}"
    puts "The total is $#{total}"
end

tip_calculator
