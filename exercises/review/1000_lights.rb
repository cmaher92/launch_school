require 'pry'
require 'minitest/autorun'
# PROBLEM
# - switches, numbered from 1 to 'n'
# - each switch connect to one light that is initially off
# - you walk down the row and toggle each one of them
# - you go back to the beginning
# - you walk down again and toggle even numbered switches
# - you walk down again and toggle odd numbered switches
# - you keep doing this until you have been through 'n' repetitions
# Details:
# Pass 1: {1=>true, 2=>true, 3=>true, 4=>true, 5=>true}
# Pass 2: {1=>true, 2=>false, 3=>true, 4=>false, 5=>true}
# Pass 3: {1=>true, 2=>true, 3=>true, 4=>true, 5=>true}

# Input:
# - 'n' total number of switches
# Output:
# - Array: [int..] the numbers for the switches that are on
# Requirements:

# EXAMPLES
# 1: { 1 => true, 2 => true, 3 => true, 4 => true, 5 => true }
# 2: { 1 => true, 2 => false, 3 => true, 4 => false, 5 => true }
# 3: { 1 => true, 2 => false, 3 => false, 4 => false, 5 => true }
# 4: { 1 => true, 2 => false, 3 => false, 4 => true, 5 => true }
# 5: { 1 => true, 2 => false, 3 => false, 4 => true, 5 => false }

# DATA STRUCTURE

# ALGORITHM
# 1. create an empty hash to hold the lights
# 2. create a multi-dimensional array
#   - the size of the array is based on 'n'
#   - the inner arrays are multiples of their position + 1
#     - [[1, 2, 3, 4, 5], [2, 4], [3], [4], [5]]

def toggle_switches(lights, nums)
  nums.each do |num|
    lights[num] = !lights[num]
  end
  lights
end

def flippin_switches(passes)
  lights = {}
  (1..passes).map do |pass|
    toggle_switches(lights, (1..passes).select { |light| light % pass == 0 })
  end
  lights.select { |light, state| state }.keys
end

class TestLights < Minitest::Test
  def setup
    @lights = {}
  end

  def test_toggle_switches
    result = toggle_switches(@lights, [1, 2, 3])
    expected = { 1 => true, 2 => true, 3 => true }
    assert_equal(expected, result)
  end

  def test_flippin_switches_5
    expected = [1, 4]
    result = flippin_switches(5)
    assert_equal expected, result
  end

  def test_flippin_switches_1000
    expected = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529,
              576, 625, 676, 729, 784, 841, 900, 961]
    result = flippin_switches(1000)
    assert_equal expected, result
  end
end
