# String#gsub
# https://docs.ruby-lang.org/en/2.7.0/String.html#method-i-gsub

# gsub(pattern, replacement)      => new_str
# gsub(pattern, hash)             => new_str
# gsub(pattern) { |match| block } => new_str
# gsub(pattern)                   => enumerator

# usage
# returns a copy of str with all occurrences of pattern substituted for the second argument.

# gsub(pattern, replacement)
# example
'hello'.gsub(/[eo]/, '*') #=> "h*ll*"
# the pattern /e/ matches with the 'e' character and replaces with '*'
# the pattern then matches with the 'o' character and replaces with '*'

# gsub(pattern, replacement)
'hello'.gsub(/[aeiou]/, '<\1>') #=> "h<e>ll<o>"
# each time any of the characters in the string match the [aeiou] character class
# the replacement argument contains a backreference to the capture group with using \d
# in this case it's referencing the only capture group, [aeiou]

# gsub(pattern) { |match| block }
"hello".gsub(/./) {|s| s.upcase + ' '} #=> "H E L L O "
# the pattern matches any character
# the current match string is passed in as a parameter to block
# in this case making the char uppercase
# as it matches everything it returns each character uppercased

# gsub(pattern, replacement)
"hello".gsub(/(?<vowel>[aeiou])/, '{\k<vowel>}')
# here the pattern defines the name of the capture group as vowel
# the capture group matches any character within [aeiou]
# the replacement string backreferences the capture group by name by using \k<name>
# in this case \k<vowel>
# The value returned by the block will be substituted for the match on each call.

# to do
# review block form as second parameter to block (global vars)
# review hash as second argument to gsub