=begin
  input
    string
  output
    new string with every uppercase letter replaced by lowercase version
    every lowercase letter replcaced by uppercase version
  rules
    no str#swapcase
    
    given a string
    string to chars
    iterate over each character in the string
      for each char
        char.upcase   if char ~= /[a-z]/ 
        char.downcase if char ~= /[A-Z]/
      end
    join arr and return
=end
require 'pry'

def swapcase(str)
  characters = str.chars.map do |char|
    case
    when char =~ /[a-z]/ then char.upcase
    when char =~ /[A-Z]/ then char.downcase
    else
      char
    end
  end
  characters.join
end

# Test cases
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'