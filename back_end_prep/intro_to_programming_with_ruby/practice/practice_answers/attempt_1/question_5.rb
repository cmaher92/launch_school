# Question 5

people = [21, 36, 43, 66, 22, 14, 12, 8, 6, 5, 4, 3, 21, 24, 25, 26]

# Find the guests who can drank
# Return their index from the original array in a list of seat numbers
seats = []

people.each_with_index do |age, seat|
  if age >= 21
    seats << seat
  end
end

p seats
