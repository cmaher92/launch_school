# Backlog
All methods, information, etc.. that I need to spend time reviewing to improve language knowledge. Once reviewied in-depth and flashcards have been created if applicable then cross out from backlog.

## General

- `#format`
- `#split`
- `#rand`
- `#chars`
- `#class`
- `#is_a?`

## Array

- `%i()` to create an array of symbols
- `#each_with_object`
- `#reduce` or `#inject` 
  - `string.chars.inject(0) { |sum, c| sum + c.ord }`
  - tried to use each_with_object by passing in an integer and it didn't work, it does however work with inject
- `#insert`
- move `#gsub` notes into this master notes file
- `permutation`
- `combination`
- `reverse_each`
- `drop_while`
- `delete_if`
- `keep_if`
- 

## Hash

- creation
- `#transform_values`
- `#has_key?`
- `#update`
- `#update_values`
- `#merge`
- `#delete`

## Enumerable

* `#each_with_object`
* `chunk`
* min
* max
* minmax
* min_by
* max_by
* Minimax_by

## String

- `#delete`
- `#chop`
- `#scan` 

## Numbers

- `#divmod`
- `#chr`

## Procs

* define proc
* call proc

## Blocks

- Define a block in a parameter
- call block

##  Regex

- Review notes in notebook and write in here
- positive and negative lookahead
  - (?=.*[a-z])`, doesn't match anything but won't return a true value if an `[a-z]` char isn't present



------

# Notes

Notes on reviewed classes, methods, modules, and other aspects of Ruby.

## Object

### Methods

#### `inspect`

*Signature*

```ruby
obj.inspect -> string
```

*Description*

* Returns a string containing human-readable representation of obj. 
  * The default `inspect` shows object's class name, an encoding of the object_id, and a list of the instance variables and their values

*Example*

```ruby
arr = [1, 2, 3]
arr.inspect
# => "[1, 2, 3]"
```





## String

- Integer-based index that represents each character

### Creation

### Element assignment

The element assignment notation of `String` can be used in order to change the value of a specified character within a string by referring to it's index. 

* `[]` with assignment will destructively alter the `String`

```ruby
str = 'hi im connor'
str[0..-1] = 'bye'
str # => 'bye'
```

### Element reference

- `#[]` and `#slice`
  - if a `match_str` is passed as argument and isn't found, returns `nil`
  - also returns `nil` if regular expression isn't found

```ruby
str[index] -> new_str or nil
str[start, number_of_chars] -> new_str or nil
str[range] -> new_str or nil
str[regexp] -> new_str or nil

str = 'abcdefghi'
str[index] -> new_str or nil
str[1] # => "b"

str(start, number_of_chars) -> new_str
str[2, 3] # => "cde"

str[range] -> new_str or nil
str[0..-3] # => "abcdefg"
# note that it is up to, and includes the character in the -3 position

str[regexp] -> new_str or nil
str = 'Barnstable total cases 591'
str[/cases [\w]+/] #=> "cases 591"

str[/(Barnstable).{13}(\d+)/, 1]
# => "Barnstable"

str[match_str] => new_str or nil
str = 'Barnstable total cases 591'
str['Barnstable'] #=> "Barnstable"
```

### Iteration

`each_char`

* passes each character in str to the given block, or returns an enum if no block given

```ruby
'abcdefg'.each_char { |char| puts char }
```



### Methods

#### match?

*Signatures*

```ruby
str.match(pattern)      -> true or false
str.match(pattern, pos) -> true or false
```

*Description*

Converts pattern to a Regexp (if it isn't already one), then returns true or false indicating whether the regexp is matched str or not without upating `$~` and other related variables. If pos is present it indicates where to begin the search.

*Examples*

```ruby
str = 'the quick brown fox jumped'
str.match?(/quick/) # => true
str.match?(/quick/, 9) # => false
```



#### count

*Signatures*

```ruby
str.count([other_str]+) -> Integer
# each other_str defines a set of characters to count
```

*Description*

* Counts the characters in the string. 

* The intersection of these sets defines the characters to count in string. 

* Sequences can be used. 

* any `other_str` that starts with a caret `^` is negated

*Examples*

```ruby
str = 'hello world'
str.count('lo') 
# => 5
# counts each instance of the 'l' character AND the 'o' character

str.count('lo', 'o')
# => 2
# the 'lo' and 'o' arguments have 'o' in common, meaning that just 'o' is counted

str.count('hello', '^l')
# => 4
# here 'h', 'e', and 'o' are counted because the '^l' negates the 'l's in the first
# argument
```



#### center

*Signature*

```ruby
str.center(width, padstr=' ') -> new_str
# pads with spaces by default
```

*Description*

* Centers str in provided width.
* If str is greater than the width, simply returns the string

*Examples*

```ruby
'hello'.center(20)
# => "       hello        "
```



## Array

- list of **elements** that are ordered by **index**

### Creation

### Element assignment

Can use assignment notation to change individual elements in an array

```ruby
arr = [1, 2, 3]
arr[0] += 1
arr
# => [2, 2, 3]
```



### Element reference

*  `#[]` and `#slice`
   *  return an `Array` or `nil`
   *  **UNLESS** only a single index is passed in `arr[1] #=> obj`

*arr[index] → obj or nil*
```ruby
    arr = ['a', 'b', 'c']
    arr[1] # => 'b'
    arr[4] # => nil
    arr[-1] # => 'c'
```

*arr[start, length] → new_arr or nil*

```ruby
arr = ['a', 'b', 'c']
arr[0, 2] # => ['a', 'b']
arr[-1, 3] # => ['c']
```

*arr[range] → new_arr or nil*

```ruby
arr = ['a', 'b', 'c']
arr[0..-1] # => ['a', 'b', 'c']
arr[1..2] # => ['b', 'c']
arr[0...2] # => ['a', 'b']
arr[0...(arr.size)] # => ['a', 'b', 'c']
```

### Conversion Methods

`to_h`

* returns the result of interpreting array as an array of `key, value` pairs
* can also be passed a block

```ruby
ary = [['a', 2], ['b', 3], ['c', 1]]
ary.to_h
# => {'a' => 2, 'b' => 3, 'c' => 1}
```

### Methods

#### `concat` 

warning: **mutating**

*Signature*

```ruby
ary.concat(other_ary1, other_ary2, ...) -> ary 
```

*Description*

Add contents from other arrays to the calling array. 

*Example*

```ruby
arr = [1, 2, 3]
arr.concat([4, 5, 6])
# => [1, 2, 3, 4, 5, 6]
```



#### `find_index`

Alias to `#index`and `#rindex`

*Signatures*

```ruby
ary.find_index(obj)             ->  int or nil
ary.find_index {|item| block}   ->  int or nil
ary.find_index                  ->  Enumerator
```

*Description*

* Returns the index of the first object in the array
* If block is given
  * returns the index of the first object for which the block returns true
  * nil if no match found

*Examples*

```ruby
a = ['a', 'b', 'c']
b = [1, 2, 3, 4, 5]
a.index('b') # => 1
a.index('z') # => nil
b.index { |num| num.odd? } # => 1
```



## Hash

* collection data structure
* use key, value pairs
  * can be of any type
  * key must be unique

### Creation

### Element assignment

The hash key is used

```ruby
hash[:apple] = 'fruit'
```



### Element reference

`#[]` 

* Retrieves the value object corresponding to the key object, if not found returns the default value.

*hsh[key] → value*

```ruby
hash = { 'a' => 100 }
hash['a'] # => 100
hash['b'] # => nil (or the default value if set)
```



`#keys`

* Returns a new array populated with the keys from the hash

```ruby
hash = { "a" => 100, "b" => 200, "c" => 300, "d" => 400 }
hash.keys # => ['a', 'b', 'c', 'd']

```



`#values`

* Returns a new array populated with the values from the hash

```ruby
hash = { "a" => 100, "b" => 200, "c" => 300, "d" => 400 }
hash.values
# => [100, 200, 300, 400]
```



`#fetch`

* Returns the value from the hash for the given key. 

* If the key isn't found
  * Without arguments, will raise a`KeyError` exception
    * `hash.fetch('a') # => 100`
  * If *default* is given, that will be returned
    * `hash.fetch('a', 'hi')` # => 'hi'
  * if *block* is given, that will be executed and result returned
    * `hash.fetch('a', 'b') { |b| puts b }` # => 'b'
    * note that the *default* is passed into the block



### Conversion Methods

`to_a`

* returns an array
  * each sub-array within the returned array is a key, value pair

```ruby
hash = { sky: 'blue', grass: 'green' }
hash.to_a
# => [[:sky, 'blue'], [:grass, 'green']]
```



### Methods

#### `group_by`

```ruby
arr = ['a', 'a', 'b', 'c']
arr.group_by { |letter| letter }
# => { 'a' => ['a', 'a'], 'b' => ['b'], 'c' => ['c'] }
```



#### `key?`

Returns true if the given key is present in hsh

```ruby
  h = { "a" => 100, "b" => 200 }
  h.has_key?("a")   #=> true
  h.has_key?("z")   #=> false
```



#### `merge (!)`

*Signatures*

```ruby
hsh.merge(other_hash1, other_hash2, ...) -> new_hash
hsh.merge(other_hash1, other_hash2, ...) { |key, old_val, new_val| block }
```

*Description*

Returns a new hash that *combines the contents of the calling hash object and the contents of the arguments*

*Details*

* without block

  * entries with duplicate keys are overwritten with the values from each `other_hash` one after another. 

  * ```ruby
    ages = {'connor' => 28, 'skylar' => 22, 'avery' => 20}
    more_ages = {'connor' => 29}
    ages.merge(more_ages)
    # => {"connor"=>29, "skylar"=>22, "avery"=>20}
    ```

* with block

  * value for each duplicate key is determined by calling the block with the key, the calling hash's value, and the argument hash's value.

  * ```ruby
    ages = {'connor' => 28, 'skylar' => 22, 'avery' => 20}
    more_ages = {'connor' => 29}
    
    ages.merge(more_ages) do |key, old_v, new_v|
      old_v > new_v ? old_v : new_v
    end
    
    # => {"connor"=>29, "skylar"=>22, "avery"=>20}
    ```

    * the higher of the two values here is returned for each duplicate key

------

## Enumerable

### Methods

#### `sort_by`

*Signatures*

```ruby
enum.sort_by { |obj| block } -> array
anum.sort_bh                 -> an_enumerator
```

*Description*

Sorts enumerable using a set of keys generated by mapping the values in enum through the given block.

Can be unstable if two keys are equal, the order of the corresponding elements is unpredictable.

```ruby
['apple', 'pear', 'fig'].sort_by { |word| word.length }
# => ['fig', 'pear', 'apple']
```



*Example*

```ruby
numbers = [0, 1, 2, 3, 4]
english_numbers = ['zero', 'one', 'two', 'three', 'four']

numbers.sort_by { |number| english_numbers[number] }
# this would sort by the corresponding element in the english_numbers array
# resulting in sorting based on characters
# => [4, 1, 3, 2, 0]
```



------

## Control Expressions

### `begin..end` 

This creates a while loop that will run the body once prior to the condition.

```ruby
a = 0
begin
 a += 1
end while a < 10
# this will increment a in the body
# then will evaluate the condition
# ends once a < 10
```

