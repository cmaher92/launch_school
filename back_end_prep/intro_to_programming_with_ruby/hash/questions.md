# Hash
# Questions to quiz myself

* 1. What is the difference between how a hash is stored and how an array is stored?
A hash is stored as 

* 2. What is an entry in a hash referred to?


3. When a hash is created what are most commonly used for keys? What are most commonly used for values?


4. All key-value pairs in a hash are surrounded by what? What are they separated by?
{},

5. What is the old way to create a hash?


6. What is the new way to create a hash?


8. In the same hash, how would you delete a key, value from the existing hash?

9. How would you simply retrieve a value from the existing hash?


10. What if we have two hashes, how could we merge those together?





11. Iterate over a hash, describing each key and value.



* 12. Create a method that accepts a name and an options hash, have it print




13. Are curly braces required when the hash is the last argument?


* 14. Call the method from question 13 again without curly braces.


15. Create a hash that has a string as a key.


16. Create a hash that has a hash as a key.


* 17. Check if a hash contains a specific key


18. Use the hash method that allows you to pass a block which returns any kay-value pairs that evaluate to true when ran through the block.


* 19. Use the hash method to pass a given key that will return its value.


20. Create a hash, then use the hash method on the hash to fetch one of its values. Have the method print "Key not found" with the keys name as well.



21. Use the hash method that returns an array version of the hash when called


22. How do you return all the keys from a hash?


23. How do you return all the values from a hash?


24. What versions of ruby do hashes remain the order in which they are stored?


27. Given a hash used a hash method to print the hash's keys and values


28. Given the following hash, how would you access the name?



29. Given the array...
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:
["demo", "dome", "mode"]
["neon", "none"]
(etc)


result = {}
words.each |word| do
    key = word.split('').order.join
    if result.has_key?(key)
      result[key].push(word)
    else
      result[key] = [word]
    end
end
