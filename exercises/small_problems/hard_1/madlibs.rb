=begin
Madlibs Revisited

Make a madlibs program that reads in some text from a text file that you
have created, and then plugs in a selection of
randomized nouns, verbs, adjectives, and adverbs into that text and prints it.
You can build your lists of nouns, verbs, adjectives, and adverbs directly
into your program, but the text data should come from a file or other external
source. Your program should read this text, and for each line,
it should place random words of the appropriate types into the text,
and print the result.

The challenge of this program isn't about writing your program;
it's about choosing how to represent your data.
Choose the right way to structure your data,
and this problem becomes a whole lot easier.

Example output:
The sleepy brown cat noisily.\n
licks the sleepy yellow
dog, who lazily licks his
tail and looks around.
=end

require 'pry'

ADJECTIVES = %w(mammoth giant spotty)
NOUNS = %w(Bandanna Fang Governance)
VERBS = %w(invent whisper scare)
ADVERBS = %w(sweetly unbearably sedately)


# create a local variable hash, with the keys ['noun', 'adverb', 'adjective' ...]
# read text from a file and save into a local variable which will be
# an array of strings
# for each line in the array of strings
  # split the string into words by splitting on spaces
  # map each word in the string
    # only grab characters a-z from the word
    # if the word is one of the hash's keys
    # replace it with a word from the value array
# now print the full result

# algorithm
# initialize a hash named 'word_generator' that contains the parts of speech as strings
# for keys and the constant array's as values.
# initialize an array that will contain the sample text from the file 'madlib.txt'
# for each sentence in sample_text array
#   split the line into an array of words
#   map the array of words
#   if the string isn't empty, grab a value from the word_generator hash
#   return that value
# puts the lines one by one

word_generator = {
  'adjective' => ADJECTIVES,
  'noun'      => NOUNS,
  'verb'      => VERBS,
  'adverb'   => ADVERBS
}
sample_text = File.readlines('madlib.txt')
sample_text.each do |sentence|
  sentence = sentence.gsub(/\n|\.|,/, '') # this works but there could be a better way
  words = sentence.split(' ')
  words.map! do |word|
    word_generator.has_key?(word) ? word_generator[word].sample : word
  end
  p words.join(' ') << '.'
end

word_generator
