# Practice Problem 8
# Using the each method, write some code to output all of the vowels from the
# strings.

hsh = {
  first: ['the', 'quick'],
  second: ['brown', 'fox'],
  third: ['jumped'],
  fourth: ['over', 'the', 'lazy', 'dog']
     }

vowels = 'aeiou'

# iterate over the values of the hashes
  # for each value string, split into chars
    # iterate over each character, if character is a vowel, print it

hsh.each_value do |arr|
  arr.each do |word|
    word.split(//).each do |char|
      puts char if vowels.include?(char)
    end
  end
end
