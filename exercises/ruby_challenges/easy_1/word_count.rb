# .scan(/[a-zA-Z]+/)

class Phrase
  attr_reader :word_count

  def initialize(phrase)
    @phrase = phrase
    @word_count = find_word_count
  end

  private

  def find_word_count
    word_counts = Hash.new(0)
    @phrase.downcase.scan(/[a-zA-Z'1-9]+/).each { |word| word_counts[word] += 1 }
    word_counts
  end
end
