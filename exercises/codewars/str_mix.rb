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
    s1 = s1.scan(/[a-z]/)
    s2 = s2.scan(/[a-z]/)

    # sort
    # turn array of chars into a hash, with a count of each char
    # select only key,value where value > 2
    h1 = {}
    h2 = {}
    s1.each do |char|
        h1[char] == nil ? h1[char] = 1 : h1[char] += 1
    end
    s2.each do |char|
        h2[char] == nil ? h2[char] = 1 : h2[char] += 1
    end
    h1 = h1.sort_by { |k, v| v }.reverse.to_h
    h2 = h2.sort_by { |k, v| v }.reverse.to_h
    [h1, h2].each { |hsh| hsh.select! { |k, v| v >= 2 }}

    letters = h1.keys + h2.keys
    letters.uniq!

    # map letters
        # for each letter
        # see if s1, s2 or equivalent
    letters.map! do |letter|
        l1 = h1.fetch(letter, 0)
        l2 = h2.fetch(letter, 0)
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
    answer = []
    letters.select! do |group| 
        if group[0] == "="
            answer << group
            false
        else
            true
        end
    end
    letters
            
end


# s1 = "A aaaa bb c"
# s2 = "& aaa bbb c d"
# p mix(s1, s2) == "1:aaaa/2:bbb"
p mix("Are they here", "yes, they are here")# == "2:eeeee/2:yy/=:hh/=:rr"

# to do
# sort the letters by the length of the string using str[2, str.length - 2]
# refactor this, i think it could be shorter