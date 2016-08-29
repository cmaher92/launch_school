# Hash
# Questions to quiz myself

1. What is the difference between how a hash is stored and how an array is stored?

2. What is an entry in a hash referred to?

3. When a hash is created what are most commonly used for keys? What are most commonly used for values?

4. All key-value pairs in a hash are surrounded by what? What are they seperated by?

5. What is the old way to create a hash?

6. What is the new way to create a hash?

7. If there was a hash that was `person = { :height => '6 ft', :weight => '160 lbs'}` how would you add the key hair with the color brown?

8. In the same hash, how would you delete the weight from the existing hash?

9. How would you simply retrieve the height from the existing hash?

10. What if we have two hashes, how could we merge those together?

11. Iterate over a hash of an animal, describing each key and value.

12. Create a method that accepts a name and an options hash, have it print
just the name if there is no options, otherwise allow it to print the name,  age and the city.

13. Are curly braces required when the hash is the last argument?

14. Call the method from question 13 again without curly braces.

15. Create a hash that has a string as a key.

16. Create a hash that has a hash as a key.

17. Check if a hash contains a specific key

18. Use the hash method that allows you to pass a block which returns any kay-value pairs that evaluate to true when ran through the block.

19. Use the hash method to pass a given key that will return its value.

20. Create a hash, then use the hash method on the hash to fetch one of its values. Have the method print "No key found" with the keys name as well.
21. Use the hash method that returns an array version of the hash when called.

22. How do you return all the keys from a hash?

23. How do you return all the values from a hash?

24. What versions of ruby do hashes remain the order in which they are stored?

25. Take the following hash and create a one-dimensional array listing only your aunts and uncles.
family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

26. If I have two hashes:
foo = {a: 1, b: 2, c: 3}
bar = {a: 'a', b: 'b', c: 'c'}
and I call foo.merge(bar) what is the result going to be?

27. Given a hash used a hash method to print the hash's keys and values
foo = {a: 1, b: 2, c: 3}

28. Given the following hash, how would you access the name?
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
