require 'pry'

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

remaining = [
  1,
  4,
  9,
  16,
  25,
  36,
  49,
  64,
  81,
  100,
  121,
  144,
  169,
  196,
  225,
  256,
  289,
  324,
  361,
  400,
  441,
  484,
  529,
  576,
  625,
  676,
  729,
  784,
  841,
  900,
  961
]
p flippin_switches(1000).count
p remaining.count
