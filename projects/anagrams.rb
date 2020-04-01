require 'pry'
require 'json'

# words = {}
# File.open("/usr/share/dict/words") do |file|
#   file.each do |line|
#     words[line.strip] = true
#   end
# end
file = File.read('/Users/cmaher/Development/words_dictionary.json')
words = JSON.parse(file)

def request_letters
  letters = []
  loop do
    break if letters.size == 6
    puts "enter letter"
    letter = gets.chomp
    letters << letter
  end
  letters
end

def find_anagrams(words)
  letters = request_letters
  poss_words = []
  (3..6).each do |num|
    poss_words += letters[0..num].permutation(num).to_a.map { |arr| arr.join }
  end
  # select only actual words
  poss_words.select do |p_word|
    # true if system("look #{p_word} > /dev/null 2>&1")
    true if words[p_word]
  end
end


# strings = %w{ cat dog tree trees treez }

# strings.each do |string|
#   if system("look #{string} > /dev/null 2>&1") 
#     puts "#{string} is a word"
#   else
#     puts "#{string} is not a word"
#   end
# end

p find_anagrams(words)
