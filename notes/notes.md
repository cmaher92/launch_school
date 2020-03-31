# Backlog
All methods, information, etc.. that I need to spend time reviewing to improve language knowledge. Once reviewied in-depth and flashcards have been created if applicable then cross out from backlog.

## Random Questions

- 

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
- `#reduce`
- `#insert`
- move `#gsub` notes into this master notes file

## Hash

- creation
- Access
- `#transform_values`
- `#has_key?`
- `#fetch`
- `#keys`
- `#values`
- `#update`
- `#update_values`
- `#merge`
- `#delete`
- 

## Enumerable

* `#sort`
* `#sort_by`
* `#each_with_object`
* 

## String

- `#delete`
- `#slice` or `#[]`
- `#chop`
- `#scan` 

## Numbers

- `#divmod`

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
- 

### Creation

### Element reference

- `#[]` and `#slice`

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



### Iterators

### Methods

