# mergeSort 'merge' function
=begin
In this excercise, we will implement the "merge" function from MergeSort.

MergeSort is often taught in Computer Science as the canonical example of the "Divide and Conquer" algorithm. 
The strategy of MergeSort is both simple and profound, leveraging two simple-to-prove mathematical facts 
(1. That every list of 1 element is "sorted" ... and 
2. It is much easier to combine two already-sorted lists into 1 sorted list than it is to sort a big list all at once) 
to yield an algorithm with a worst-case complexity of O(n log n).

Basically, MergeSort works like this:

If we get a list of size 1, then it's already sorted: we're done. Just return that value.
Otherwise; break the list you have to sort in half: 
2a. MergeSort the first half. 2b. MergeSort the second half. 
2c. "Merge" the two sorted lists for 2a and 2b together. Voila: sorted.
2c is where the MergeSort "merge" function comes in. 
It takes two already-sorted lists (arrays, in this example) and returns one large sorted list.

The name of the function in this example is "mergesorted". 
It should return a big sorted array from two smaller sorted arrays: e.g.

mergesorted([1,2],[3,4]) //should: [1,2,3,4]

mergesorted([1,2],[3]) //should: [1,2,3]

mergesorted([1],[2, 3]) //should: [1,2,3]
=end

# new_arr
# given two arrays
# create a new sorted array size of two arrays
# track next items
# loop until both arr1 and arr2 are exhausted
  # break when counter is the size of the results array
  # if first array is exhausted or element in second array is smaller
    # append element from second array
    # increment second_idx by 1
  # if second array is exhausted or element in first array is smaller
    # append element from first array
    # increment second_idx by 1

def merged(first, second)
  results = Array.new(first.size + second.size)
  first_idx = 0
  second_idx = 0
  idx = 0

  while idx < results.size
    if first[first_idx].nil? || second[second_idx].nil?
      if first[first_idx].nil?
        results[idx] = second[second_idx]
        second_idx += 1
        idx += 1
        next
      else 
        results[idx] = first[first_idx]
        first_idx += 1
        idx += 1
        next
      end
    end

    if first[first_idx] <= second[second_idx]
      results[idx] = first[first_idx]
      first_idx += 1
    else
      results[idx] = second[second_idx]
      second_idx += 1
    end
    idx += 1
  end

  results
end

p merged([1,2,3],[1,2,3]) == [1,1,2,2,3,3]
p merged([1,2,3],[4,5,6]) == [1,2,3,4,5,6]
p merged([1,2,3],[4])     == [1,2,3,4]
p merged([4], [1,2,3])    == [1,2,3,4]
