# Strings mix problem (4)
# link: https://www.codewars.com/kata/5629db57620258aa9d000014/ruby

require 'pry'

# input
# String; containg lowercase, capitals, and other chars
# String; containg lowercase, capitals, and other chars

# output
# String; visualize the difference in the strings

# remove all chars that aren't lowercase from both s1 and s2
# s1.scan(/[a-z]{2,}/)
    #['aaaa', 'bb']

# transform into array of arrays [letter, count]
    # s1 = [["a", 4], ["b", 2]]
    # s2 = [["a", 3], ["b", 3]] 

# transform each array into hash
    # s1 = {"a"=>4, "b"=>2}
    # s2 = {"a"=>3, "b"=>3}

# grab keys from each hash and combine into an array
# make unique
# ['a', 'b']

def mix(s1, s2)
    s1 = s1.scan(/[a-z]{2,}/)
    s2 = s2.scan(/[a-z]{2,}/)
    s1.map! { |letters| [letters[0],letters.length] }
    s2.map! { |letters| [letters[0],letters.length] }
    s1 = s1.to_h
    s2 = s2.to_h
    letters = s1.keys + s2.keys
    letters.uniq!

    # map letters
        # for each letter
        # see if s1, s2 or equivalent
    letters.map! do |letter|
        l1 = s1.fetch(letter, 0)
        l2 = s2.fetch(letter, 0)
        result = l1 <=> l2
        case result
        when 0
            "=:#{letter * l1}"
        when 1
            "1:#{letter * l1}"
        else
            "2:#{letter * l2}"
        end
    end
    letters.join('/')
end


s1 = "A aaaa bb c"
s2 = "& aaa bbb c d"
p mix(s1, s2) == "1:aaaa/2:bbb"
p mix("Are they here", "yes, they are here")# == "2:eeeee/2:yy/=:hh/=:rr"

# to do
# the case statement is messing with the output, i think it's how I'm creating the string