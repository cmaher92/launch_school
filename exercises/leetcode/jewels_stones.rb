def num_jewels_in_stones(j, s)
    # input
    # j, string, representing the types of stones that are jewels
    # s, string, representing the stones you have
    
    # output
    # int, the number of jewels you have
    
    # rules
    # letters are case sensitive, so 'a' is different type of stone from 'A'
    
    # given a string that defines the jewels you have, and a string that defines all the jewels you have
    # return the number of jewels you have in the stones string
    # split up the jewels string into chars
    # for each jewel, count the number and add to the sum
    # return to the sum
    
    num_jewels = 0
    j.chars.each { |jewel| num_jewels += s.count(jewel) }
    num_jewels
    
end

puts num_jewels_in_stones('aA', 'aAAbbbb')
puts num_jewels_in_stones('z', 'ZZ')