=begin
Create the function prefill that returns an array of n elements
that all have the same value v. See if you can do this without using a loop.

You have to validate input:

v can be anything (primitive or otherwise)
if v is ommited, fill the array with undefined
if n is 0, return an empty array
if n is anything other than an integer or integer-formatted string (e.g. '123')
that is >=0, throw a TypeError
When throwing a TypeError, the message should be n is invalid,
where you replace n for the actual value passed to the function.
=end

=begin

input
  integer - determines the number of elements to fill the array
  object  - what the array should be prefilled with
output
  array - n elements
rules
  - don't use a loop
  - if v is omitted, fill the array with nil
  - if n is 0, return an empty array
  - if n is anything but an integer or integer formatted string
  that is at least 0
  throw a TypeError, the message should be n is invalid
  where you replace n for the actual value passed in

generate an array based on the n (number of elements) and v (value to prefill)

check if n is a number or string representation of a number that is >= 0
  if it is not, throw TypeError 'n is invalid' n is the value actually passed
check if n is 0, if it is return an empty array
generate the array passing in n, and v

=end

def prefill(n, v)
  return Array.new if n == 0
  if n =~ /\d+/
    n = n.to_i
  else
    raise TypeError, "#{n} is invalid"
  end

  Array.new(n, v)
end

# Test cases
p prefill(3,1)     == [1,1,1]
p prefill(2,"abc") == ['abc','abc']
p prefill("1", 1)  == [1]
p prefill(3, prefill(2,'2d')) == [['2d','2d'],['2d','2d'],['2d','2d']]

prefill("xyz", 1)
