# notes on Regexp class
# https://docs.ruby-lang.org/en/2.7.0/regexp_rdoc.html

# created with
pattern   = /[abc]/
pattern_2 = %r{[abc]}
pattern_3 = Regexp.new(/[abc]/)

# basic pattern matching operator
# =~
/hay/ =~ 'haystack' # => 0
# return behavior
# if match is found, the operator returns the index of the first match of the string
# if not match is found, returns nil

# After a successful match the '$~' global variable is set containing the a MatchData object.
p $~
#=> #<MatchData "connor">

# backreference within a pattern
/[csh](..) [csh]\1 in/.match("The cat sat in the hat")
#=> #<MatchData "cat sat in" 1:"at">

# access the back referenced data with MatchData#[]
data = /[csh](..) [csh]\1 in/.match("The cat sat in the hat")
data[1]
#=> 'at'

# reference by name
data = /\$(?<dollars>\d+)\.(?<cents>\d+)/.match("$3.67")
data
#=> #<MatchData "$3.67" dollars:"3" cents:"67">
data[:dollars]
#=> "3"

# to review
    # backreferencing by name within a pattern
    # grouping
    # alternation
    # anchors

# see docs on Regexp for more information
