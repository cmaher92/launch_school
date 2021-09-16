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
# var: 9 --> 11

# DATA STRUCTURE

# ALGORITHM
# 1. create an empty hash to hold the lights
# 2. walk down the row of lights 'n' number of times
# 3. if it's pass 1, toggle every lights
# 4. if it's pass 2, toggle even lights
# 5. if it's pass 3. toggle odd lights

def toggle_switch(lights, num)
  lights[num] = !lights[num]
  lights
end

def flippin_switches(n)
  lights = {}
  n.times do |i|
    pass = i + 1
    case
    when pass == 1
      (1..n).each { |light_num| toggle_switch(lights, light_num) }
    when pass.odd?
      (1..n).select(&:odd?).each { |light_num| toggle_switch(lights, light_num) }
    when pass.even?
      (1..n).select(&:even?).each { |light_num| toggle_switch(lights, light_num) }
    end
  end
  lights.select { |_, state| state == true }.keys
end

class TestLights < Minitest::Test
  def setup
    @lights = { 1 => true, 2 => true, 3 => true }
  end

  def test_toggle_switch_on
    result = toggle_switch(@lights, 1)
    expected = { 1 => false, 2 => true, 3 => true }
    assert_equal(expected, result)
  end

  def test_toggle_switch_off
    expected = { 1 => true, 2 => true, 3 => true }
    result = toggle_switch(@lights, 1)
    resutl = toggle_switch(@lights, 1)
    assert_equal(expected, result)
  end
end
