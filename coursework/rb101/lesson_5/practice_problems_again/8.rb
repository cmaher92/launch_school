# practice problem 8
# Using the each method, output all of the vowels from the strings

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |arr|
  arr.each { |str| str.chars.select { |char| p char if 'aeiou'.include?(char) } }
end
