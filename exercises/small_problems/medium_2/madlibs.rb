# Madlibs Revisited

# Let's build another program using madlibs. 
# We made a program like this in the easy exercises. 
# This time, the requirements are a bit different.

# Make a madlibs program that reads in some text from a text file that you have created, 
# and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. 
# You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, 
# but the text data should come from a file or other external source. 
# Your program should read this text, and for each line, 
# it should place random words of the appropriate types into the text, and print the result.

# The challenge of this program isn't about writing your program; 
# it's about choosing how to represent your data. Choose the right way to structure your data, 
# and this problem becomes a whole lot easier. 
# This is why we don't show you what the input data looks like; 
# the input representation is your responsibility.

ADVERBS    = %w(seriously recently immediately clearly slightly rarely)
VERBS      = %w(learn change read want study impose)
NOUNS      = %w(internet science computer software book)
ADJECTIVES = %w(determined loving loyal polite creative kind bright)

File.readlines('madlibs.txt', chomp: true).each do |line| 
  p sprintf(line, adjective: ADJECTIVES.sample, 
                  noun:      NOUNS.sample, 
                  adverb:    ADVERBS.sample,
                  verb:      VERBS.sample)
end
