# Regexp Methods Blog

## Research

Find snippets where you have demonstrated how each method has helped.

### `String.scan`

I was given a problem that provides a string `3a4B2d`and asks that you expand out the string multiping each character with the number that precedes it, if no preceding numbers, leave as is. 

> Given a string that includes alphanumeric characters ('3a4B2d') return the expansion of the string: The numeric values represent the occurances of each letter preceding that numeric value. There shoud be no numeric characters in the final string. Empty strings should return an empty string. There first occurance of a numeric value should be the number of times each character behind it is repeated, until the next numeric value appears. 

```ruby
'3d332f2a' # => 'dddffaa'
```

In the above example the substrings '3d', '2f', and '2a' are relevant to the solution, everything else is irrelevant. In this case, just the '33' that precede the '2f'.

Scan is the perfect method for this solution, as it allows flexible patterns to define what is matched, and whatever matched is conveniently returned into an array.

I work out that the pattern should capture a digit character if present, up to 1, preceding at least one string character. It should also not care about case. 



#### Building the expression

```ruby
/\d{0,1}[a-z]+/i
str = '3d332f2a'
```

* Here, the `\d` matches a digit, the subsequent `{0, 1}` means that it should match 0 or 1 `\d` characters. 
* The `[a-z]` means that following 0 to 1 digit character(s) should be any single character in the range of a-z.
  * The subsequent `+` means that there should be at least one for this to be a valid match
* the `i` character at the end of the pattern makes the pattern as a whole case insensitive

So at this point, if you were to throw the string into rubular, a regular expression editor that's great for testing patterns, you would see that this pattern matches the substrings '3d', '2f', '2a'. 

<img src="/Users/cmaher/Desktop/Screen Shot 2020-04-22 at 12.04.38 AM.png" alt="Screen Shot 2020-04-22 at 12.04.38 AM" style="zoom:50%;" />



#### Where String.scan makes life easy

```ruby
str = '3d332f2a'
str.scan(/\d{0,1}[a-z]+/i)
# => ["3d", "2f", "2a"]
```

I'm not going to work out the entire problem but the most difficult aspect of this problem was retrieving the proper substrings. Specifically ignoring numeric characters that precede other numeric characters. 

