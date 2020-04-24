# The objective is to return all pairs of integers 
# from a given collection of integers that have a difference of 2.
# The result should be sorted in ascending order.
# The input will consist of unique values. 
# The order of the integers in the input collection should not matter.

# Examples
#[1, 2, 3, 4]      -->  [[1, 3], [2, 4]]
#[4, 1, 2, 3]      -->  [[1, 3], [2, 4]]
#[1, 23, 3, 4, 7]  -->  [[1, 3]]
#[4, 3, 1, 5, 6]   -->  [[1, 3], [3, 5], [4, 6]]

# test cases
twos_difference([1, 2, 3, 4])    == [[1, 3], [2, 4]]
twos_difference([1, 3, 4, 6])    == [[1, 3], [4, 6]]
twos_difference([0, 3, 1, 4])    == [[1, 3]]
twos_difference([4, 1, 2, 3])    == [[1, 3], [2, 4]]
twos_difference([6, 3, 4, 1, 5]) == [[1, 3], [3, 5], [4, 6]]
twos_difference([3, 1, 6, 4])    == [[1, 3], [4, 6]]
twos_difference([1, 3, 5, 6, 8, 10, 15, 32, 12, 14, 56]) == [[1, 3], [3, 5], [6, 8], [8, 10], [10, 12], [12, 14]]
twos_difference([1, 4, 7, 10]) == []
twos_difference([]) == []