
# input; 2 arrays
# a; integers;
# b; integers;
# boolean
# true if the elements in a have an element in b where if a were squared they would be the same
# false otherwise

# rules
# must be the same length, otherwise return false
# if both are empty, also return false
require 'pry'

def comp(a, b)
    return false if a.length != b.length || (a.length == 0 || b.length == 0)
    a.map! { |n| n*n }.sort!
    b.sort!
    a.each_with_index do |a_num, idx|
        return false if a_num != b[idx]
    end
    true
    # loop, comparing each element, return false if not the same
end

a = [4, 4]
b = [1, 31]

p comp(a, b)