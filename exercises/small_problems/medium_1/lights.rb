# 1000 lights
# medium 1, problem 4

# < Integer, number of switches
# > Array, identifying which switches are on
# ! bank of switches numbered, 1..n
# ! each switch connected to exactly one light that is initially off
# ! toggle multiples of pass
#    - first pass, toggle all switches where switch % pass_n equals 0
# &
# Create an array the length of n, with false values
# loop for each pass, from 1..n
#   loop for each switch from 1..n
#     toggle switch if switches[switch - 1] % pass_num == 0
# return array of which switches are on
  # if the array is true, map the value to it's index + 1
require 'pry'

def toggle_switch(switches, switch_num)
  switches[switch_num - 1] = !switches[switch_num - 1]
  switches
end

def switches_on(switches)
  # returns switches that are on
  switches.map.with_index { |switch, i| (i + 1) if switch == true }.select { |e| e.is_a?(Integer) }
end

def toggle_switches(n)
  switches = (1..n).to_a.map { |n| false }
  1.upto(n) do |pass_num|
    1.upto(n) do |switch_num|
      if switch_num % pass_num == 0
        toggle_switch(switches, switch_num)
      end
    end
  end
  switches_on(switches)
end

# p switches_on([true, false, false, true, false])

p toggle_switches(5)
p toggle_switches(10)
p toggle_switches(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
