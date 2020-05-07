# Text Door Neighbors

# Notes
# Do not wrap around a side of the keypad when finding adjacent numbers. 
# That is, do not consider 6 adjacent to 4 nor 0 adjacent to 2.
# Do not consider numbers that are diagonal to each other adjacent
# Do not worry about invalid characters, nil, or anything other than a valid number string being passed in
# Do not worry about the order of number strings in the array being returned

# First, let's take a look at the classic phone keypad:

# 1 2 3
# 4 5 6
# 7 8 9
#   0


# We can consider certain numbers adjacent if they appear directly next to or above/below each other. 
# For example, 1 is adjacent to 2 and 4 (and nothing else), while 5 is adjacent to 2, 4, 6, and 8.

# Let's look for phone numbers that are "neighbors" of a given phone number by having any one (and only one) 
# of their digits be off-by-one as a number adjacent to the original.

# By this definition, 555-555-5555 has both its original neighbors but also, 
# 554-555-5555 and 555-555-5558.

# Problem
# Given a phone number of integer length N (1 ≤ N ≤ 10) as a number string 
# (e.g. 555-555-5555 would be passed as "5555555555"), return an array of all 
# phone numbers as number strings that would be considered neighbors of that phone number.

# < String
# > Array of Strings; each number of the string will find all number neighbors
# ! only one string digit will be changed at a time
# ! n will be between 1..10 in length

# algorithm
# find neighbors for number string based on index position
#   - loop over each character with index, passing in the entire string + index to helper method
#   - add each result from iteration to results array
#   create a helper method neighbors_by_index(number_str, index)
#     - retrieve number_neighbors for the number_str at index
#       - map in index to neighbor_map -> ['neighbors'*]
#       - ('12345678', 0)z
#         - retrieve number neighbors array from mapping hash
#         - map over each number neighbor, replacing the string digit at index in param
# return results array

# algorithm without helper method
# split the phone number into characters and their index position
# 


require 'pry'

NUMBER_NEIGHBORS = { 
  '1' => %w(2 4), 
  '2' => %w(1 5 3), 
  '3' => %w(2 6),
  '4' => %w(1 5 7),
  '5' => %w(2 4 6 8),
  '6' => %w(3 5 9)
  '7' => %w(4 8),
  '8' => %w(7 5 9 0),
  '9' => %w(6 8),
  '0' => %w(8)
}

def numbers_of(phone_number)
  phone_number.chars.with_index.flat_map do |number, index|
    NUMBER_NEIGHBORS[number].map { |repl| phone_number[0...index] + repl + phone_number[index+1..-1] }
  end
end

# def number_neighbors_by_index(phone_number, index)
#   num_str = phone_number.chars.at(index)
#   neighbors = NUMBER_NEIGHBORS[num_str]
#   neighbors.map do |neighbor|
#     phone_number[0...index] + neighbor + phone_number[(index + 1)..-1]
#   end
# end

# def neighbors_of(phone_number)
#   results = []
#   index = 0

#   while index < phone_number.length
#     results += number_neighbors_by_index(phone_number, index)
#     index += 1
#   end

#   results
# end


# Helper tests
# p number_neighbors_by_index("5675309", 0)
# p number_neighbors_by_index("8675309", 0)
# p number_neighbors_by_index("8675309", 1)
# p number_neighbors_by_index("8675309", 2)
# p number_neighbors_by_index("8675309", 3)


# Test cases
# p neighbors_of("1") == ["2", "4"]
p neighbors_of("8675309").sort == [
  "5675309", "7675309", "9675309", "0675309", "8375309", "8575309", "8975309",
  "8645309", "8685309", "8672309", "8674309", "8676309", "8678309", "8675209",
  "8675609", "8675389", "8675306", "8675308"
].sort
# p neighbors_of("0163995")
