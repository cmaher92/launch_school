# Squared Strings
# Codewars (5 Kyu)
# Time: 35, 

# squared string has n lines
# each substring being n characters
# s = "abcd\nefgh\nijkl\nmnop"
# s is a squared string of size 4

# - we will use squared strings to code/decode text
# - original text doesn't include the character '\n'

# coding
# - takes a text (t) of length (l)
# - considering the smallest ineteger (n) such that (n) * (n) be greater or equal to (l)
# - complete text with the char of ascii code 11 
#     - we suppose that this char is not in our original text until
#       length of (t) is (n) * (n)
# - from now on we can transform the new (t) in a squared string (s) of size (n) by inserting
#   '\n' where needed
# - apply a clockwise rotation of 90 degrees to (s)

# decoding
# - a squared string (s) resulting from the coding
# - apply a counter-clockwise rotation of 90 degrees to (s)
# - do some cleaning to have the original text (t)

# example provided
# t = "I.was.going.fishing.that.morning.at.ten.o'clock"
# code(t) -> "c.nhsoI\nltiahi.\noentinw\ncng.nga\nk..mg.s\n\voao.f.\n\v'trtig"
# decode(code(t)) == "I.was.going.fishing.that.morning.at.ten.o'clock"
# - dots indicate spaces

# end of instructions
# ------------------------------------------------------------------------

# understanding the problem
# - 2 methods
# - squared string is made up of n lines, each line containing n characters
# - squared strings are what is used to perform #code(t) and #decode(t)
# - key
#   - t, text
#   - l, length
#   - s, squared string
# - rules
#   - original text will not containg newline character
# - code(t) -> "c.nhsoI\nltiahi.\noentinw\ncng.nga\nk..mg.s\n\voao.f.\n\v'trtig"
#   - t = "I.was.going.fishing.that.morning.at.ten.o'clock"
#   - create squared string from t
#     - find the smallest integer that is >= to the length
#       - find length of t, 47
#       - find out lowest number squared >= to length
#       - 1**2, 2**2, 3**2, in which n**2 is the first result that's >= length
#         - in this case it would be 7, because 7**2 == 49
#       - split the string into an array of n*n
#         - 
