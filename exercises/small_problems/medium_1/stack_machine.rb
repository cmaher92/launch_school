# mini language
# medium 1, problem 6

# ! stack 
#   - is a list of values that grows and shrinks dynamically
# ! register
#   - current value
# ! operations that require two values use the register value and the topmost value on stack
# ! n - places a value n in the 'register'
# ! PUSH - push the register value on the stack, leave the value in the register
# ! ADD - pops a value from the stack and adds it to the register values
# ! SUB - pops a value from the stack and multiplies it by the register value
# ! MULT - pops a value from the stack and multiplies it by the register value
# ! DIV - pops a value from the stack and divides it into the register value
# ! MOD - pops a value from the stack and divides it into the register value
# ! POP - remove the topmost item from the stack and place in register
# ! PRINT - PRINT the register value
# ! register should be initialized to 0

# < String - command
# > Integer

# &
# parse the string
#   - split on spaces
#   - if the substr in an integer, convert
#   - assign to local var comamnds
# run the commands in sequential order from the commands list
#   - handle each command through a case statement
require 'pry'
require 'pry-byebug'


def PUSH(stack, register)
  stack << register
end

def POP(stack, register)
  register = stack.pop
end

def ADD(stack, register)
  register += stack.pop
end

def SUB(stack, register)
  register -= stack.pop
end

def MULT(stack, register)
  register *= stack.pop
end

def DIV(stack, register)
  register /= stack.pop
end

def MOD(stack, register)
  register = register % stack.pop
end

def PRINT(register)
  puts register
end

def minilang(commands)
  register = 0
  stack = []
  commands = commands.split.map { |command| command.match?(/\d/) ? command.to_i : command }
  commands.each do |command|
    # binding.pry
    case
    when command.is_a?(Integer) then register = command
    when command == 'PUSH'  then PUSH(stack, register)
    when command == 'POP'   then register = POP(stack, register)
    when command == 'ADD'   then register = ADD(stack, register)
    when command == 'SUB'   then register = SUB(stack, register)
    when command == 'MULT'  then register = MULT(stack, register)
    when command == 'DIV'   then register = DIV(stack, register)
    when command == 'MOD'   then register = MOD(stack, register)
    when command == 'PRINT' then PRINT(register)
    else
      puts "Invalid command"
    end
  end
end

# minilang('5 PUSH 3 MULT PRINT')
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# minilang('5 PUSH POP PRINT')
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# minilang('-3 PUSH 5 SUB PRINT')
# minilang('6 PUSH')
