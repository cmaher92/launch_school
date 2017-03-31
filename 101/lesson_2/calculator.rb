# ask the user for two numbers
# ask the user for the type of operation
# perform the operation on the two numbers
# output the result

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  if number.to_i != 0
    true
  else
    false
  end
end

number1 = ''
loop do
  prompt('Welcome to the calculator!')
  number1 = gets.chomp
  
  if valid_number?(number1)
    break
  else
    prompt("Hmm... that doesn't look like a valid number")
  end
end

loop do
  prompt("What's the first number?")
  number1 = gets.chomp
  
  if valid_number?(number)
    break
  else
    prompt("Hmm... that doesn't look like a valid number")
  end
end
  
prompt("What's the second number?")
number2 = Kernel.gets().chomp()

prompt(" What operation would you like to perform? 1) add, 2)
              subtract, 3) multiply, 4) divide")
operator = Kernel.gets().chomp()

if operator    == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
elsif operator == '4'
  result = number1.to_f() / number2.to_f()
end

result = case operator
         when '1'
           number1.to_i() + number2.to_i()
         when '2'
           number1.to_i() - number2.to_i()
         when '3'
           number1.to_i() * number2.to_i()
         when '4'
           number1.to_f() / number2.to_f()
end

prompt("The result is #{result}")
