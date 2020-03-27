def sum_pairs(ints, sum)
  seen = {}
  ints.each do |int|
    # saves each int to a hash to store that the int has been seen
    # takes the sum, subtracts the current int, if the remainder is in the 
    # seen, returns the remainder and the int
    return [sum-int, int] if seen[sum-int]
    seen[int] = true
  end
  nil
end

# what makes this approach so effective is that it only has to loop over the
# collection one time, while checking the created hash to see if the sum can 
# be found. the smart part here is realizing that by subtracting the current int
# from the sum you will be left with the missing number
# for example, if the sum is 10 and the current number is 7, 10-7 = 3
# it checks the hash to see if a 3 has been seen before
# if it has, it returns the current number plus the remainder