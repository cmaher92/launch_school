require 'pry'
require 'minitest/autorun'
#

# Details:
# stack - list of values that grows and shrinks dynamically (array)
# register - current value
# - operations that require two values pop the topmost item from the stack and
#   performs the operation on the popped value and the register value, result
#   then becomes the register

# MULT example
# stack: [3, 6, 4]
# register: 7
# (pop 4 from stack)
# stack: [3, 6]
# register: 7 * 4 ->  24

# Requirements:
# - all operations are integer operations
# - input: operation (string)
# - all programs are correct
# - register: 0

# EXAMPLES
# var: 9 --> 11

# DATA STRUCTURE

# ALGORITHM
# 1.

VALID_OPERATIONS = {
  PRINT: true,
  POP: true,
  MOD: true,
  DIV: true,
  SUB: true,
  ADD: true,
  PUSH: true,
  MULT: true
}

def valid_instruction?(instruction)
  !!(VALID_OPERATIONS[instruction.to_sym])
end

def parse_instructions(instructions)
  instruction_set = instructions.split(' ').map do |instruction|
    valid_instruction?(instruction) ? instruction : instruction.to_i
  end
end

def minilang(instructions)
  register = 0
  stack = []

  instruction_set = parse_instructions(instructions)

  instruction_set.each do |instruction|
    case instruction
    when Integer then register = instruction
    when 'PRINT'
      puts register
    when 'PUSH'
      stack << register
    when 'ADD'
      register += stack.pop
    when 'SUB'
      register -= stack.pop
    when 'MULT'
      register *= stack.pop
    when 'DIV'
      register /= stack.pop
    when 'MOD'
      register %= stack.pop
    when 'POP'
      register = stack.pop
    end
  end
end




class TestStackMachine < Minitest::Test
  def setup
  end

  def test_print
    skip
    assert_output("0\n") { minilang('PRINT') }
  end

  def test_parse_instructions
    assert_equal(['PRINT'],parse_instructions('PRINT'))
    assert_equal([2, 'PRINT'],parse_instructions('2 PRINT'))
    assert_equal([5, 'PUSH', 3, 'MULT', 'PRINT'], parse_instructions('5 PUSH 3 MULT PRINT'))

    instructions = '3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT'
    expected = [
      3,
      'PUSH',
      4,
      'PUSH',
      5,
      'PUSH',
      'PRINT',
      'ADD',
      'PRINT',
      'POP',
      'PRINT',
      'ADD',
      'PRINT'
    ]
    assert_equal(expected, parse_instructions(instructions))
  end

  def test_minilang_print
    assert_output("0\n") { minilang('PRINT') }
  end

  def test_minilang_n_and_print
    assert_output("9\n") { minilang('9 PRINT') }
  end

  def test_minilang_push_and_add
    instructions = '9 PUSH 10 ADD PRINT'
    assert_output("19\n") { minilang(instructions) }
  end

  def test_minilang_push_and_subtract
    instructions = '9 PUSH 10 SUB PRINT'
    assert_output("1\n") { minilang(instructions) }
  end

  def test_minilang_div
    instructions = '10 PUSH 100 DIV PRINT'
    assert_output("10\n") { minilang(instructions) }
  end

  def test_minilang_mod
    instructions = '10 PUSH 100 MOD PRINT'
    assert_output("0\n") { minilang(instructions) }
  end

  def test_minilang_pop
    instructions = '10 PUSH 9 PUSH 8 PUSH 7 PUSH POP POP POP PRINT'
    assert_output("9\n") { minilang(instructions) }
  end

  def test_cases
    assert_output("0\n") { minilang('PRINT') }
    assert_output("15\n") { minilang('5 PUSH 3 MULT PRINT') }
    assert_output("5\n3\n8\n") { minilang('5 PRINT PUSH 3 PRINT ADD PRINT') }
    assert_output("5\n") { minilang('5 PUSH POP PRINT') }
    assert_output("5\n10\n4\n7\n") { minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')}
    assert_output("6\n") { minilang('3 PUSH PUSH 7 DIV MULT PRINT ') }
    assert_output("12\n") { minilang('4 PUSH PUSH 7 MOD MULT PRINT ') }
    assert_output("8\n") { minilang('-3 PUSH 5 SUB PRINT') }
    assert_output(nil) { minilang('6 PUSH') }
  end

end
