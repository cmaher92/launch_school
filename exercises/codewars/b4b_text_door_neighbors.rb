# Text door neighbor
# 5 Kyu
# Code Review
# Solution by: Blind4Basics

require 'pry'

# hash with each number string pointing to array of neighbor strings
KEY_NET = "1:24 2:135 3:26 4:157 5:2468 6:359 7:48 8:0579 9:68 0:8"
                .scan(/(\d):(\d+)/) # => Array of subarrays
                .map{ |d,repl|  [d, repl.chars] } # replaces each neighbors string with an array ['1', '24'] => ['1', ['2', '4']]
                .to_h # => conversts to hash, string number as keys, array of strings as values

def neighbors_of(phone_number)
  binding.pry
  # phone_number.chars.flat_map.with_index is the key
  # the above calls turn the string into an array containing each number str and index of that number str
  # then key passes in each character of the phone number to the KEY_NET, which returns an array of neighboring number strs
    # finally, maps that result returning phone number
  phone_number.chars.flat_map.with_index{ |d,i|
      KEY_NET[d].map{ |repl| phone_number[0...i] + repl + phone_number[i+1..-1] }
  }
end

p neighbors_of("0163995")
