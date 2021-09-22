# longest sentence
# set: small problems: med 2
# date: 09/22/2021

# require 'minitest/autorun'
require 'pry'

SPEECH = <<HERE
Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.
HERE

# algo
# + current_word: string
# + current_sentence: array
# + sentences: array
# - break down text into words and sentences
#   - if char is space or \n:
#     - append current_word to current_sentence
#     - clear current_word
#     - next
#   - if char is either (. ! ?):
#     - append to current_word
#     - append current_word to current_sentence
#     - append current_sentence to sentences
#     - clear both current_word and current_sentence
#   - else:
#     - append char to current_word


def longest_sentence(text)
  current_word = ""
  current_sentence = []
  sentences = []

  text.each_char do |char|
    case char
    when " ", "\n" # word delimiter
      next if current_word.empty?
      current_sentence << current_word
      current_word = ""
    when ".", "?", "!" # sentence delimiter
      current_word << char
      current_sentence << current_word
      sentences << current_sentence
      current_word = ""
      current_sentence = []
    else # regular character
      current_word << char
    end
  end

  sentences.map do |sentence|
    [sentence.size, sentence.join(' ')]
  end
end

pp longest_sentence(SPEECH)


# class Test < Minitest::Test
#     def test_base_cases
#       p longest_sentence(SPEECH)
#     end
# end