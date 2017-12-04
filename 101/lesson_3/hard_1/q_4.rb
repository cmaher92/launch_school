=begin
Question 4

Ben was tasked to write a simple ruby method to determine if an input string
is an IP address representing dot-separated numbers. e.g. "10.4.5.11".
He is not familiar with regular expressions.
Alyssa supplied Ben with a method called is_an_ip_number?
that determines if a string is a valid ip address number and asked Ben to use it.

Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things.
You're not returning a false condition,
and you're not handling the case that there are
more or fewer than 4 components to the IP address
(e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

Help Ben fix his code.
=end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".") # splits the string with '.' into arr
  # handle case where more or less than 4 items
  return false if dot_seperated_words !4
  while dot_separated_words.size > 0 do         # while the size of the arr > 0
    word = dot_separated_words.pop              # pop the word from the arr
    return false unless is_an_ip_number?(word)
  end
  return true
end

p dot_seperated_ip_address("10.4.3.2")
