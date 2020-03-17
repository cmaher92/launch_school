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

# I opted for splitting of the sentences to prevent using the same word
# when there was more than one parts of speech in a single sentence.
# I also use #pop instead of #sample to prevent the madlib from having
# the same part-of-speech used multiple times.

word_generator = {
  'adjective' => %w(mammoth giant spotty small),
  'noun'      => %w(bandanna fang pickle),
  'verb'      => %w(invent whisper scare),
  'adverb'   => %w(sweetly unbearably sedately)
}
sample_text = File.readlines('madlib.txt')
sample_text.each do |sentence|
  formatted_sentence = sentence.split.map do |word|
    case
    when word =~ /%{adjective}/
      format(word, adjective: word_generator['adjective'].pop)
    when word =~ /%{noun}/
      format(word, noun: word_generator['noun'].pop)
    when word =~ /%{verb}/
      format(word, verb: word_generator['verb'].pop)
    when word =~ /%{adverb}/
      format(word, adverb: word_generator['adverb'].pop)
    else
      word
    end
  end
  p formatted_sentence.join(' ')
end
