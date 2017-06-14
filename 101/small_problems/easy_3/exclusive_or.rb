# exclusive or

# The || operator returns true if either or both of its operands are true,
# false if both operands are false. The && operator returns true if both of
# its operands are true, and false if either operand is false. This works great
# until you need only one of two conditions to be true, the so-called exclusive
# or.

# In this exercise, you will write a method named xor that takes two arguments,
# and returns true if exactly one of its arguments is true, false otherwise.

# understanding
# input
# 	2 booleans
# output
# 	boolean

# algorithm
# check for only one argument that is true
	# if neither true
	# 	return false
	# elsif both true
	# 	return false
	# else
	# 	return true

def xor?(bool1, bool2)
	if bool1 && bool2 # both true
		false
	elsif !!bool1 == false && !!bool2 == false # neither true
		false
	else
		true
	end
end

# Test cases
puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

# solution
# def xor?(val1, val2)
# 	return true if val1 && !val2
# 	return true if !val1 && val2
# 	false
# end

# even shorter
# def xor?(val1, val2)
# 	(val1 && !val2) || (!val1 && val2)
# end

# further explanation
# you always have to check both values using an xor comparison method/operator
