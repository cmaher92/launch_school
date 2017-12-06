=begin
Lettercase Counter

Write a method that takes a string, and then returns a hash that contains 3 
entries: one represents the number of characters in the string that are 
lowercase letters, one the number of characters that are uppercase letters, 
and one the number of characters that are neither.

input
  string
hash
  numbers in characters in string lowercase
  number of characters that are uppercase
  neither characters that are not upper or lowercase
  
  create a hash using new functionality to set the value's default to 0
  turn the string into an array
    for each character in the string
    if it's not a string, incremement :neither
    if it's uppercase, increment the hash
    if it's lowercase, incremenet the hash
  return the hash
=end

def letter_case_count(str)
  chars = {:neither => 0, :uppercase => 0, :lowercase => 0}
  str.chars.each do |char|
    case
      when char =~ (/[^a-z]/i) then chars[:neither]   += 1
      when char =~ (/[A-Z]/)   then chars[:uppercase] += 1
      when char =~ (/[a-z]/)   then chars[:lowercase] += 1
    end
  end
  chars
end 

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }





=begin
Hide Solution & Discussion
Solution

def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end

Discussion

This method is expected to return a hash of character counts, so we'll create a counts hash to store that data.

Next, we use Array#count to find the number of occurrences of lowercase, uppercase, and all other characters.

With that we have the data needed to satisfy this problem's requirements: a hash that has the count of characters that are lowercase, uppercase, or neither.

We use regular expressions to count certain types of characters. We'll explain things a bit here for those who aren't familiar with regex:

char =~ /[a-z]/ : This checks if the character is a lowercase letter between a and z. char =~ /[A-Z]/ : This checks if the character is an uppercase letter between A and Z. char =~ /[^A-Za-z]/ : This checks if the character is neither an uppercase letter nor a lowercase letter.
=end