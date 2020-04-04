# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i != 0
end

def valid_operator?(operator)
  %w(1 2 3 4 5).include?(operator)
end

def retrieve_number(which_number)
  number = nil
  loop do
    prompt("Whats the #{which_number} number?")
    number = gets.chomp
    valid_number?(number) ? break : prompt("Please enter a valid number")
  end
  number
end

def retrieve_operator
  operator = nil
  msg = "What operation would you like to perform\n1) add\n2) subtract\n3) multiply\n4) divide"
  loop do
    prompt(msg)
    operator = gets.chomp
    valid_operator?(operator) ? break : prompt("Please enter a valid operator")
  end
  operator
end

def display_result(result, operator)
  operations = %w(Adding Subtracting Multiplying Dividing)
  operation_str = operations[(operator.to_i - 1)]
  prompt("#{operation_str}...")
  prompt(result.to_s)
end

def calculate_result(numbers, operator)
  numbers.map!(&:to_i)
  case operator
  when '1' then numbers.sum
  when '2' then numbers.reduce(:-)
  when '3' then numbers.reduce(:*)
  when '4' then (numbers[0].to_f / numbers[1]).round(2)
  end
end

loop do
  prompt('Welcome to the calculator!')
  number1 = retrieve_number('first')
  number2 = retrieve_number('second')

  operator = retrieve_operator

  result = calculate_result([number1, number2], operator)
  display_result(result, operator)
  prompt("Would you like to perform another calculation? (Y to calculate again)")
  another = gets.chomp
  another.downcase == 'y' ? prompt('ok! restarting calculator') : break
end
prompt("Thank you for using the calculator, goodbye!")
