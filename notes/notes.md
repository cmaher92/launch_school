# Backlog
All methods, information, etc.. that I need to spend time reviewing to improve language knowledge. Once reviewied in-depth and flashcards have been created if applicable then cross out from backlog.

## Random Questions

- https://www.neilwithdata.com/mathematics-self-learner

## General

- `#format`
- `#split`
- `#rand`
- `(&:*)`, what specifically does the `&` symbol represent here
- `#chars`
- `#inspect`
- `#class`
- `#is_a?`
- begin/rescue
- keyword `next` (return value)
- order of precedence
- 

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

## Hash

- creation
- `#transform_values`
- `#has_key?`
- `#update`
- `#update_values`
- `#merge`
- `#delete`

## Enumerable

* `#sort`
* `#sort_by`
* `#each_with_object`
* 

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

Once something is reviewed, move here.

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

#### group_by

```ruby
arr = ['a', 'a', 'b', 'c']
arr.group_by { |letter| letter }
# => { 'a' => ['a', 'a'], 'b' => ['b'], 'c' => ['c'] }
```


```

```