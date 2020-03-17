# Question 4


people = [21, 36, 43, 66, 22, 14, 12, 8, 6, 5, 4, 3, 21, 24, 25, 26]

arr = people.select do |person|
  person >= 21
end

p arr.length

# A select statement is the quickest way to find the values that I am looking for. A select statement that doesn't modify that caller returns a new array with the elements that return true to the expression in the block. For instance this block simply checks each element in the array and returns true to the elements that are over 21. I then take the length and am able to quickly return the number of guests that are over 21. 
