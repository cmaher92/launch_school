Mandatory Blocks

The Array#bsearch method is used to search ordered Arrays more quickly than #find and #select can. Assume you have the following code:

a = [1, 4, 8, 11, 15, 19]
How would you search this Array to find the first element whose value exceeds 8?

Hide Solution & Discussion
Solution

value = a.bsearch { |element| element > 8 }
puts value # => 11
Discussion

The documentation for Array#bsearch has the signature:

bsearch {|x| block } → elem
This signature shows that #bsearch takes only one argument - a block - and returns an element of the Array to which it is applied. We can also see that the block is required, and that it takes one argument. The text and examples below the signature tell and show us that the block must return true or false when operating in what is called "find-minimum mode", which is the usual use case.

Putting this all together, we can devise our call to #bsearch: we use a as the receiver (the object to which #bsearch is applied), a block of { |element| element > 8 } to find the first element whose value is greater than 8, and we store the return value to a variable named value. The value of value is then printed, which shows that #bsearch found the 11 in a.

For more information on what #bsearch does and why it is faster, see the Wikipedia article on the Binary search algorithm. #bsearch uses this algorithm.
