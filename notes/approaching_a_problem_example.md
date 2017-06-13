# Odd words problem

# Consider a character set of letters, a space, and a point. Words consist of 
# one or more, but at most 20 letters. An input text consists of one or more words seperated from ecah other
# by one or more spaces and terminated by 0 or more spaces followed by a point. Input should be read from,
# an including, the first letter of the first word, up to and including the terminated point. The output 
# text is to be produced such that successive words are separated by a single
# space with the last word being terminated by a single point. Odd words are copied
# in reverse order while even words are merely echoed.

# For exmaple, the input string:
# whats the matter with kansas.

# becomes:
# whats eht matter htiw kansas.

# Understanding the problem
# Input
#   Separated by: 
#       1 - many spaces
#   terminated by:
#       0 - many spaces
#       followed by a point
#   chars:
#       letter, space, point, up to 20 letters
# Output
#   words: have the odd words reversed
#   separated by one space between words
#   terminated: 0 space, followed by a dot