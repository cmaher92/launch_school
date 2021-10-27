# advanced 1/ madlibs revisted


require 'pry'
# require 'minitest/autorun'

# Details:
# - read in text from file
# - plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it
# - nouns, verbs, adjectives, and adverbs can be hardcoded
# Input: File; reads in text from a text file
# Output: STDOUT
# Requirements:

# EXAMPLES
# - read each line from file in
# - split the line on spaces into an array, 'The %{adj} %{noun} %{adv}' --> ['The', '%{adj}', '%{noun}', '%{adv}']
# - if element is key in hash, return a random element from value (REPLACEMENTS)
# - Join the array back together on spaces
# - Append to output array

# DATA STRUCTURE

# ALGORITHM
# 1.

REPLACEMENT_WORDS = { "%{verb}" => %w(jumps lifts bites licks),
                      "%{adjective}" => %w(quick lazy sleepy ugly),
                      "%{noun}" => %w(cat kitten giraffe chair),
                      "%{adverb}" => %w(easily lazily noisily excitedly)
                    }

# read each line in from file
lines = File.readlines('madlib_text.txt', chomp: true)

# for each line, gsub each token with a sampled value from REPLACEMENT_WORDS
lines.map! do |line|
  line.gsub(/(%{verb}|%{noun}|%{adjective}|%{adverb})/) { |match| REPLACEMENT_WORDS[match].sample }
end

puts lines
