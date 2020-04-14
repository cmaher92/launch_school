# Practice problems

## Problems to make

### Short

* When a hash is passed into a method, how can alter the hash's data without affecting the original hash object
* .call / .yield for blocks/procs
* begin/rescue
* order of precedence

### Long

* find all combinations of elements within an array
  * sequential elements
  * non-sequentially (all possible combinations)

## Small Practice Problems

1. Return value of split [0, 1]

```ruby
# What is returned?
str = 'connor'
str.split
```

2. Return value of map when called by Hash [0, 1]

```ruby
# What is returned?
hash = { connor: 28, megan: 24, avery: 20, skylar: 22 }
hash.map { |k, v| v += 1 }
```

3. Return value of variable inititalized inside of for loop [1, 0]

```ruby
# What is returned?
for number in [1, 2, 3]
  a = 0
  puts number
end
a
# => 
```

4. Return value of a for loop [1, 0]

```ruby
# What is returend?
return_value = for number in [1, 2, 3]
  puts number
end
return_value
# =>
```

5. Using `until `as a modifier

```ruby
# print a once it reference a value of at least 10
a = 0
# code here
p a # 11
```

6. `begin/end` to write a loop that executes the body once before the condition

```ruby
# write a loop that runs the body once before the condition
# use begin/end
p a # 11
```

7. `next` statement to skip over iteration and return value for the block

```ruby
# map over array, if it's multiply by 2
[1, 2, 3].map do |number|
end
```

8. Printing human-readable version of the object

```ruby
# return a human readable version of an object
ary = [1, 2, 3]
# => "[1, 2, 3]"
```

9. What is the return value of `index`

```ruby
b.index { |num| num.odd? }
# => 
```

10. What does the block consider for `index`

```ruby

```

11. What does the following return?

```ruby
['a', 1].sort
```

12. Using `sort` return the array in reversed order [1, 0]

```ruby
ary = [1, 2, 3, 4, 5]

# => [5, 4, 3, 2, 1]
```

13. When using `dup` or `clone` with a collection, what is returned?

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!

arr2
arr1 
```

14. What does `arr1` and `arr2` reference in the following code?

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

arr1
arr2
```



15. What will be returned when invoking the `add_name` method

```ruby
names = ['connor', 'skylar']

def add_name(arr, name)
  arr = arr + [name]
end

add_names(names, 'avery')
puts names.inspect # => 
```



16. What will `reverse_each` return when called on a Hash?

```ruby
people = { connor: 28, megan: 24, avery: 20, skylar: 22 }
people.reverse_each do |name, age|
  puts name, age
end
# ...
# =>
```



17. What will `reverse_each` return when called on an Array?

```ruby
[1, 2, 3].reverse_each { |num| puts num }
# ...
# => 
```



18. Given an array, drop the number that are less than 3

```ruby
arr = [1, 2, 3, 4, 5]
# => [3, 4, 5]
```



19. Given an array, add items to the array. Modifies the caller.

```ruby
arr = [1, 2, 3]

p arr
# => "[1, 2, 3, 4, 5, 6]"
```



20. Given an array, add items to the array, without modifying the caller.

```ruby
arr = [1, 2, 3]
arr2 = [4, 5, 6]
new_arr = # write solution here
p arr 
# => "[1, 2, 3]"
p new_arr
# => "[1, 2, 3, 4, 5, 6]"Given a string, see if there is a match in the string that matches the word 'connor', return a boolean value.
```



21. Given `str` see if the word 'connor' is matched anywhere in the string, return a boolean [1, 0]

```ruby
str = 'how tall is connor?'

# => true
```



22. Sort the array of arrays which contain numeric strings, we want to sort the outer array so that the inner arrays are ordered according to the *numeric* value of the strings they contain. 

```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]
```

[Source]: https://launchschool.com/lessons/c53f2250/assignments/c633cf37	"Working With Blocks"



23. Return an integer larger than 13 from the first sub-array and an item with a size less than 6 from the second sub-array. 

```ruby
numbers_and_fruits = [[8, 13, 27], ['apple', 'banana', 'cantaloupe']]
numbers_and_fruits.map do |arr|
  arr.select do |item|
    # write code here
  end
end 
# => [[27], ["apple"]]
```
[Source]: https://launchschool.com/lessons/c53f2250/assignments/c633cf37	"Working With Blocks"



24. Call the `take_block` method and have it print the number 32.

```ruby
def take_block(number, &block)
  block.call(number)
end
```



25. Transform the given array into a hash of grouped values, the `key` is the character and the `value` is an array of all characters.

```ruby
arr = ["a", "l", "p", "h", "a", "b", "e", "t", "s", "o", "u", "p"]

# => {"a"=>["a", "a"], "l"=>["l"], "p"=>["p", "p"], "h"=>["h"], "b"=>["b"], "e"=>["e"],           "t"=>["t"], "s"=>["s"],"o"=>["o"], "u"=>["u"] }

```

26. Given an array, find the sum of each variation of two digits.

```ruby
arr = [1, 2, 3]
# hint, Array.permutation
```

27. Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

```ruby
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

```

