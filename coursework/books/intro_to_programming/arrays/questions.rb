# Questions for reviewing array chapter

# 1. What is an array?
An array is an indexed list of items

# 2.  How do you define an array in ruby?
array = []

# 3.  How do you grab the first element of an array?
array.first

# 4. How about the last element?
array.last

# 5. What is an indexed list?
A list where each slot of the array is numbered

# 6. How would you remove the last item from an array?
array.pop

# 7. Does the above method mutate the caller?
Yes

# 8. How do you add an item to an array?
array.push

# 9. What's another method to add to an array?
<<

# 10. Square all the numbers in an array
foo = [1, 2, 3, 4, 5]
foo.each { |n| n**2 }

# 11. Which method can you use to delete an item at a specific index?
foo.delete_at(0)

# 12. What method would you use if you wanted to delete all instances of a
# provided value?
foo.delete(1)

# 13. What method would you use to iterate over an array and delete all of the
# existing duplicates, returning the results as a new array?

# 14. How would you force this method to destructively modify the array?

# 15. What does destrucively mean in the above sentence?

# 16. What method iterates over an array and returns a new array with the items
# that return true to the expression provided?

# 17. Does this method mutate the caller?

# 18. How do you add the item you specify to the front of the list?

# 19. What method checks to see if the arg given is included in the array?

# 20. What does it return?

# 21. What method can be used to take an array with nested arrays as elements
# and return a one-dimensional array

# 22. Is the above method mutating?

# 23. Which method iterates through an array and passes the index not it's value
# into the block?

# 24. Which method can be used to return a sorted array?

# 25. Is the above method destructive?

# 26. Which method combines two arrays that are a combination of all elements?

# 27. Which method provides an easy way of iterating over a collection in ruby and
# is more preferred to using the for loop?

# 28. What is used for iteration?

# 29. What is used for transformation?

# 30. What's the difference between .index() and .index[]
