# ghts
# You have a bank of switches before you, numbered from 1 to n.
# Each switch is connected to exactly one light that is initially off.
# You walk down the row of switches and toggle every one of them.
# You go back to the beginning, and on this second pass, you toggle switches
# 2, 4, 6, and so on.
# On the third pass, you go back again to the beginning and toggle switches
# 3, 6, 9, and so on.
# You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument,
# the total number of switches,
# and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# switches 1 to n
# each switch is connected to one light that is initially off
# first pass - every switch toggled
# second     - 2, 4, 6, ...
# third      - 3, 6, 9, ...
# continue n times

# input
#   int - number of switches and number of times to toggle lights
# output
#   the lights that are on

# create a hash
# loop from 1..n
#   within the loop assign the number to false

# loop from 1..n do |pass|
#   loop from 0..n-1 do |index|
#     toggle light if the light num mod pass == 0

require 'pry'

def what_lights(n)
  lights = Hash.new

  1.upto(n) do |num|
    lights[num] = false
  end

  lights = toggle_lights(lights, n)

  # return the lights that are true
  lights.select { |k, v| v == true }.keys
end

def toggle_lights(lights, n)

    1.upto(n) do |pass|
      1.upto(n) do |light_num|
        lights[light_num] = !lights[light_num] if light_num % pass == 0
      end
    end

    lights
end

# How can I refactor?
# abstract the toggle_lights function

# Further exploration
# Do you notice the pattern in our answer? Every light that is on is a
# perfect square. Why is that?
# [1, 1, 1, 1, 1] num % 2
# [1, 3, 5]       num % 3
# [1, 5]          num % 4
# [1, 4, 5]       num % 5
# [1, 4]
# A perfect square is defined as any number that has a whole number square root
# When given 6
# Each pass of the lights is eliminating non-perfect squares
#   for example when you pass in 5
#   all of the lights are turned on
#   then all multiples of 2 are toggled leaving [1, 3, 5]
#   within [1, 3, 5] there are no perfect squares
#   then all multiples of 3 are toggled, leaving [1, 5]
#   then we hit 4, which is a perfect square, turning that light on
#   now we are at [1, 4, 5]
#   so 5 is not a perfect square and on the 5th pass that light is turned off
#   leaving us with 1 and 5
#   I'm not sure the details of how this works mathmatically but essentially
#   it's a system of eliminating non-perfect squares
#   It seems like there is a perfect square every x numbers + 2
#   for example 1 is a perfect square, there are 3 numbers in between the next
#   1 - > 4 (perfect square, + 3)
#   4 ->  9 (perfect square, + 5)
#   9 -> 16 (perfect square, + 7)
#   that pattern will keep going

# What are some alternatives for solving this exercise?
# What if we used an Array to represent our 1000 lights instead of a Hash,
# how would that change our code?
# Instead of a hash we would have an array of booleans
# Then we would keep the nested loops but we would start at 0 for the
# second loop because an Array is an indexed-collection.


# We could have a method that replicates the output from the description of
# this problem (i.e. "lights 2, 3, and 5 are now off; 1 and 4 are on.")
# How would we go about writing that code?

# method for replicating output
# input
#   array of numbers
# output
#   string, representing what lights are on

# examples
# "light 1 is on"
# "light 1 and 2 are on"
# "lights 1, 2 and 3 are on"

# given an array
# use a case statement
# case size of arr is 1, puts "light n is on"
# case size of arr is 2, puts "light n, n2 are on"
# third case statement would trigger a function that builds a string

# building_string function
#   given an array of at least 3 elements
#   str = "lights arr[0], "
#   loop over the array, stopping prior the the last element
#     every element appends to the string << "#{element}, "
#   the final element is appended as "and #{element} are on"

p what_lights(5)
p what_lights(6)
p what_lights(7)
p what_lights(8)
p what_lights(9)
p what_lights(1000)

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].
