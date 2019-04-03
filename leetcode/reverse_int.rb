def reverse(x)
    # input
    # integer - 32-bit signed
    # output
    # integer - reversed integer
    # rules
    # if there is a leading 0, drop the 0
    # if it's more than 31 bits, return 0
    
    # check the #bit_length of the passed in integer, if it's > 31 return 0
    # check if x is negative, if it is, change neg variable to true
    # convert the int to a string, reverse the string, convert back to an int
    # check if neg variable is true, if it is return the int converted to negative, otherwise just return the int
    neg = true if x < 0
    x = x.to_s.reverse.to_i
    x = -x if neg == true
    x.bit_length > 31 ? 0 : x
end

p reverse(120)
p reverse(-123)
p reverse(123)