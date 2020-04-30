# Text Door Neighbors

# Notes
# Do not wrap around a side of the keypad when finding adjacent numbers. That is, do not consider 6 adjacent to 4 nor 0 adjacent to 2.
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

# By this definition, 555-555-5555 has both its original neighbors but also, e.g., 
# 554-555-5555 and 555-555-5558.

# Problem
# Given a phone number of integer length N (1 ≤ N ≤ 10) as a number string 
# (e.g. 555-555-5555 would be passed as "5555555555"), return an array of all 
# phone numbers as number strings that would be considered neighbors of that phone number.

def neighbors_of(phone_number)
end




p neighbors_of("1") == ["2", "4"]
p neighbors_of("8675309") == ["5675309", "7675309", "9675309", "0675309", "8375309", "8575309", "8975309",
   "8645309", "8685309", "8672309", "8674309", "8676309", "8678309", "8675209",
   "8675609", "8675389", "8675306", "8675308"]