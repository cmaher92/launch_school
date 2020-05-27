# simple number sequence

=begin
In this Kata, you will be given a string of numbers in sequence and your task will be to return the missing number. 
If there is no number missing or there is an error in the sequence, return -1.

For example:

missing("123567") = 4 
missing("899091939495") = 92
missing("9899101102") = 100
missing("599600601602") = -1 -- no number missing
missing("8990919395") = -1 -- error in sequence. Both 92 and 94 missing.
The sequence will always be in ascending order.

More examples in the test cases.

Good luck!
=end

# input:
#   - String
# output:
#   - Integer
# rules/constraints:
#   - return -1 if no missing number in sequence
#   - return -1 if multiple numbers missing
#   - sequence will always be in ascending order
# test input/output
#   - '123567'
#   - '1'
#   - '1' -> 1
#   - 6
#   - 
# algorithm/data structure:
#   - condense sequence and compare with a range
#     - condense sequence
#     - create a comparison_sequence
#       - take first element, convert to integer
#       - end of range is first element + number of elements in condensed sequence
#       - print both

def condense_sequence(sequence)
  condensed = []
  sequence.each_with_index do |e, i|
    i.even? ? condensed << e : condensed[-1] << e
  end
  condensed
end

def missing(sequence)
  sequence = sequence.split(//)
  until sequence.length == 1
    first = sequence.first.to_i
    last = first + sequence.length
    test_sequence = (first..last).to_a.map(&:to_s)
    # if (test_sequence - sequence).size == 1
    #   return (test_sequence - sequence).first.to_i
    # end
    p test_sequence
    p sequence
    sequence = condense_sequence(sequence)
  end
  -1
end

# p missing("123567") == 4 
# p missing("899091939495") == 92

p missing("9899101102") #== 100
# missing("599600601602") == -1 #-- no number missing
# missing("8990919395") == -1 #-- error in sequence. Both 92 and 94 missing.
