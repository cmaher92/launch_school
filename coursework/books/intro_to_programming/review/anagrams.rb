words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
    'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
    'flow', 'neon']

# given the words array
# write a program that returns an array of anagrams (words with same letters)

# create anagrams hash where the key will be the sorted string and 
# the value will be an array of strings, each string having the same letters as the key
# comparing strings with each other
# split the string, sort the string, join the string, to symbol
# if the symbol isn't a key in the anagrams hash, add to hash with string in the array value
# if it is a key, add the original string to the hash's value array

anagrams = {}
words.each do |word|
    sym = word.split(//).sort.join.to_sym
    anagrams.has_key?(sym) ? anagrams[sym].push(word) : anagrams[sym] = [word]
end
anagrams.values.each { |value| p value }