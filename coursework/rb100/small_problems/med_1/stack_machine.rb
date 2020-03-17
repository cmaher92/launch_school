# A stack is a list of values that grows and shrinks dynamically.
# In ruby, a stack is easily implemented as an Array that just uses the
# #push and #pop methods.

# A stack-and-register programming language is a language that uses a stack
# of values. Each operation in the language operates on a register,
# which can be thought of as the current value.
# The register is not part of the stack.
# Operations that require two values pop the topmost item from the stack
# (that is, the operation removes the most recently pushed value from the stack),
# perform the operation using the popped value and the register value,
# and then store the result back in the register.

# Consider a MULT operation in a stack-and-register language.
# It multiplies the stack value with the register value,
# removes the value from the stack, and then stores the result back in the
# register.
# Thus, if we start with a stack of 3 6 4
# (where 4 is the topmost item in the stack),
# and a register value of 7,
# then the MULT operation will transform things to 3 6 on the stack
# (the 4 is removed), and the result of the multiplication, 28,
# is left in the register.
# If we do another MULT at this point, then the stack is transformed to 3,
# and the register is left with the value 168.

# Write a method that implements a miniature stack-and-register-based
# programming language that has the following commands:

=begin
n Place a value n in the "register". Do not modify the stack.
PUSH Push the register value on to the stack. Leave the value in the register.
ADD Pops a value from the stack and adds it to the register value,
storing the result in the register.
SUB Pops a value from the stack and subtracts it from the register value,
storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value,
storing the result in the register.
DIV Pops a value from the stack and divides it into the register value,
storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value,
storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value
All operations are integer operations (which is only important with DIV and MOD).


Programs will be supplied to your language method via a string passed in as an
argument. Your program may assume that all programs are correct programs;
that is, they won't do anything like try to pop a non-existent value from the
stack, and they won't contain unknown tokens.

You should initialize the register to 0.
=end
# input
  # string - contains command sand numbers
# output
  # integer - the value of the function passed in


# given the instructions
# initialize register to 0
# parse the string for instructions and numbers
  # split the string into array on spaces
  # map the string integers to integers in the array



def minilang(instructions)
  stack    = []
  register = 0
  functions = {
    'PUSH' => Proc.new { stack.push(register) },
    'ADD'  => Proc.new { register += stack.pop },
    'SUB'  => Proc.new { register -= stack.pop },
    'MULT' => Proc.new { register = stack.pop * register },
    'DIV'  => Proc.new { register = register / stack.pop },
    'MOD'  => Proc.new { register = register % stack.pop },
    'POP'  => Proc.new { register = stack.pop },
    'PRINT'=> Proc.new { puts register },
    'STACK'=> Proc.new { puts stack }
  }

  instructions = instructions.split
  instructions.map! do |instruction|
    if instruction.to_i != 0
      instruction.to_i
    else
      instruction
    end
  end

  instructions.each do |instruction|
    if instruction.is_a?(Integer)
      register = instruction
      next
    end
    functions[instruction].call
  end
end

# write a program that can evaluate and print the result of this input
# (3 + (4 * 5) - 7) / (5 % 3)
# write this in a way that minilang can work the problem
minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 PUSH 5 PUSH 4 MULT ADD SUB DIV PRINT')
# The tough part with this instruction set is that you need to consider
# the order of operations, the operations that will occur last need to be
# pushed on the stack first. So in a way you need to have the forethought to 
# work backwards. 

# # Examples:
# minilang('PRINT')
# # 0
#
# minilang('5 PUSH 3 MULT PRINT')
# adds 5 to the register
# adds the 5 to the stack
# adds 3 to register
# [5]
# register = 3 * 5
# print's register
# => 5

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

# minilang('5 PUSH POP PRINT')
# 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

# minilang('-3 PUSH 5 SUB PRINT')
# 8

# minilang('6 PUSH')
# (nothing printed; no PRINT commands)
