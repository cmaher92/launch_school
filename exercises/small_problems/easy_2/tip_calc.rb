# Tip calculator
# Create a simple tip calculator. 
# The program should prompt for a bill amount and a tip rate. 
# The program must compute the tip and then display both the tip and the total amount of the bill.

# - Input:
#   - Float: user-input; bill
#   - Float: user-input; tip
# - Output:
#   - String: tip
#   - Total: total
# - Rules:
#   - both outputs should be in float form rounded to only display 2 digits after decimal pt
#   - assume valid input

# - Data structure:
#   -  Floats to save the user-inputted tip and bill and total

# - Algorithm:
#   - prompt user for total and convert to float
#   - prompt user for tip percentage and convert to float
#     - also turn percentage into decimal form by dividing by 100
#   - output tip and total

def calc_tip
  puts "<< What is the bill?"
  bill = gets.chomp.to_f
  puts "<< What is the tip percentage?"
  tip = gets.chomp.to_f / 100

  tip = format('%0.2f', (bill * tip))
  total = format('%0.2f', (bill + tip.to_f))

  puts "\nResult ----"
  puts "The tip is   $#{tip}"
  puts "The total is $#{total}"
end

calc_tip

# - Test:
# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0