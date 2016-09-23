# Hash
# Questions to quiz myself

1. What is the difference between how a hash is stored and how an array is stored?
A has stores each item by associated keys, arrays store items by an ordered index

2. What is an entry in a hash referred to?
A key-value pair, creating an associative representation of data

3. When a hash is created what are most commonly used for keys? What are most commonly used for values?
Symbols are most commonly used for keys
Data types are most commonly used for values

4. All key-value pairs in a hash are surrounded by what? What are they seperated by?
{},

5. What is the old way to create a hash?
classmates = {:Connor => 12}

6. What is the new way to create a hash?
classmates = {Connor: 12}

7. If there was a hash that was `person = { :height => '6 ft', :weight => '160 lbs'}` how would you add the key hair with the color brown?
person[:hair] = 'brown'

8. In the same hash, how would you delete the weight from the existing hash?
person.delete(:weight)

9. How would you simply retrieve the height from the existing hash?
person[:height]

10. What if we have two hashes, how could we merge those together?
Connor = { height: '6 ft', weight: '165 lbs' }
John = { height: '6 ft 1 inch', weight: '170 lbs' }
=> {height: '6 ft 1 inch', weight: '170 lbs'}

11. Iterate over a hash of an animal, describing each key and value.
animal = { height: '6 ft', weight: '165 lbs', type: 'donkey' }
animal.each { |key, value| puts key, value }
or
animal.each do |key, value|
  'This animal is a #{key}, #{value}'
end

12. Create a method that accepts a name and an options hash, have it print
just the name if there is no options, otherwise allow it to print the name,  age and the city.
def greeting(name, options = {})
  if options.empty?
    puts "Hello #{name}"
  else
    puts "Hello #{name}, you are #{options[:age]} and live in #{options[:city]}"
  end
end

13. Are curly braces required when the hash is the last argument?
No

14. Call the method from question 13 again without curly braces.
greeting("Connor", age: 24, city: "Seattle")

15. Create a hash that has a string as a key.
string_hash = {"Connor" => 24}

16. Create a hash that has a hash as a key.
hash_hash = {{"Connor": 24} => "male"}

17. Check if a hash contains a specific key
animal.has_key?(:height)

18. Use the hash method that allows you to pass a block which returns any kay-value pairs that evaluate to true when ran through the block.
animal = { height: '5ft 11', weight: 190 }
animal.select { |key, value| key == :weight }
=> {:weight => 190}

19. Use the hash method to pass a given key that will return its value.
animal.fetch(:weight)

20. Create a hash, then use the hash method on the hash to fetch one of its values. Have the method print "No key found" with the keys name as well.
animal = { height: '5ft 11', weight: 190 }
animal.fetch(:weight)
=> 190
animal.fetch(:color)
=> KeyError: key not found: :color

21. Use the hash method that returns an array version of the hash when called
animal.to_a
=> [[:height, '5ft 11'], [:weight, 190]]

22. How do you return all the keys from a hash?
animal.keys

23. How do you return all the values from a hash?
animal.values

24. What versions of ruby do hashes remain the order in which they are stored?
1.9

25. Take the following hash and create a one-dimensional array listing only your aunts and uncles.
family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

aunts_uncles = family.select do |key, value|
  key == :aunts or key == :uncles
end

extended_family = aunts_uncles.values.flatten
p extended_family

26. If I have two hashes:
foo = {a: 1, b: 2, c: 3}
bar = {a: 'a', b: 'b', c: 'c'}
and I call foo.merge(bar) what is the result going to be?
=> {a: 'a', b: 'b', c: 'c' }

27. Given a hash used a hash method to print the hash's keys and values
foo = {a: 1, b: 2, c: 3}
foo.each { |key, value| puts key, value }

28. Given the following hash, how would you access the name?
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
person[:name]

29. Given the array...
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
Write a program that prints out groups of words that are anagrams.

result = {}
words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end
