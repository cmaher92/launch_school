# Double char

=begin
Write a method that takes a string and returns a new string in which every
character is doubled

=end

# input
#   string
# output
#   string with every character in original string doubled

# given a string
# init a results arr
# split the string into chars
# for each character in the string append to the result arr twice
# join the results array
# return 

def repeater(str)
  results = []
  str.chars.each do |char|
    2.times { results << char }
  end
  results.join
end


# Test cases
p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''