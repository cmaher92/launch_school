# 1.
# An array is an ordered list of elements that can be of any type.

# 2.
array = [1, "team", []]

# 3.
array.first

# 4.
array.last

# 5.
# Each element in an array is numbered

# 6.
array.pop

# 7.
# yes

# 8.
array.push

# 9.
array <<

# 10.
# not mutating
array.map { |n| n**2 }

# 11.
array.delete_at(3)

# 12.
array = ["Cam", "Connor", "Connor"]
array.delete("Connor")
# => "Connor"
# array = ["Cam"]

# 13.
array = ["Cam", "Cam", "Connor", "Connor", "Kyle"]
array.uniq
# => ["Cam", "Connor", "Kyle"]

# 14.
array.uniq!
# => ["Cam", "Connor", "Kyle"]
# array = ["Cam", "Connor", "Kyle"]

# 15.
# It mutates the caller, which in this case is the array

# 16.
numbers = [1, 2, 3, 4, 5, 6, 7]
numbers.select { |n| n > 4 }
# => [5, 6, 7]

# 17.
# no

# 18.
numbers.unshift(0)
# => [0, 1, 2, 3, 4, 5, 6, 7]
# this is a mutating method

# 19.
numbers.include?(0)
# => true

# 20.
# true

# 21.
nested_array = [1, 2, 3, [1, 2, 3], [2, 3, 4]]
nested_array.flatten
# => [1, 2, 3, 1, 2, 3, 2, 3, 4]

# 22.
# no

# 23.
numbers.each_index { |index| "This is the index #{index}" }
# => 
