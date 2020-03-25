# more zeros

# input
# string
# output
# array; only with char's that had more zeros than ones
# rules
# remove any duplicate characters, keeping the first occurance of any such duplicates
# leading zeros in binary don't count
require 'pry'

def more_zeros(s)
    s.split(//).select do |char|
        binary = "%b" % char.ord
        binary.count('0') > binary.count('1')
    end.uniq
end

p more_zeros('abcde')
p more_zeros('Great job!')
p more_zeros('DIGEST')
p more_zeros('abcdeabcde')