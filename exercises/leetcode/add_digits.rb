def add_digits(num)
  # input
  # integer
  # output
  # single digit number
  
  # return if number is single digit
    # divide the number by 10, if it's less than one return the number
  # if number is not single digit
    # split the number into digits using integer#digits method
    # sum the numbers using Array#reduce
    # call add_digits passing the current number
    
  return num if (num / 10) < 1
  add_digits(num.digits.reduce(:+))
  
end

# test cases
p add_digits(38) == 2