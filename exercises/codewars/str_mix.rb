# Strings mix problem (4)
# link: https://www.codewars.com/kata/5629db57620258aa9d000014/ruby
# finished
# time: 4.5 hours roughly

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
require 'pry'

def make_hash(str)
    h = {}
    str.gsub(/[a-z]/) do |letter|
        h[letter] == nil ? h[letter] = 1 : h[letter] += 1
    end
    h.reject! { |k, v| v < 2 }
end

def mix(s1, s2)
    h1 = make_hash(s1)
    h2 = make_hash(s2)
    result = h1.keys + h2.keys
    result.uniq!

    result.map! do |key|
        c1 = h1.fetch(key, 0)
        c2 = h2.fetch(key, 0)
        case c1 <=> c2
        when 1
            ["1:", key * c1]
        when -1
            ["2:", key * c2]
        else
            ["=:", key * c1]
        end
    end
    result.sort! do |a, b|
        b[1].length <=> a[1].length
    end
    result
    # sort by length of chars
    # sort by prefix 1:, 2:, =:
    # sort by lexicographical order
    # sorting_hash = { 4 => { '1:' => [], '2:' => [], '=:' => [] }}
    sorting_hash = {}
    result.each do |k, v|
        key = v.length
        if sorting_hash[key] == nil
            sorting_hash[key] = { '1:' => [], '2:' => [], '=:' => [] }
            sorting_hash[key][k] << v
        else
            sorting_hash[key][k] << v
        end
    end
    sorting_hash.each do |k,v|
        v.each { |k, v| v.sort! }
    end
    results_arr = []
    sorting_hash.each_value do |hash|
        hash.each do |key, value|
            value.each { |v| results_arr << "#{key}#{v}"}
        end
    end
    results_arr.join('/')
end


# s1 = "A aaaa bb c"
# s2 = "& aaa bbb c d"
# p mix(s1, s2) == "1:aaaa/2:bbb"
p mix("Are they here", "yes, they are here") == "2:eeeee/2:yy/=:hh/=:rr"
p mix("looping is fun but dangerous", "less dangerous than coding") == "1:ooo/1:uuu/2:sss/=:nnn/1:ii/2:aa/2:dd/2:ee/=:gg"


# to do
# sort the letters by the length of the string using str[2, str.length - 2]
# refactor this, i think it could be shorter