# madlibs.rb
# easy_8
# problem_2

# ask for noun, verb, an adverb, and an adjective
# output story plugging in the words

def prompt(msg)
  puts ">> #{msg}"
end

def print_sentence(sentence, words)
  result = sentence.split.map do |word|
    if word.include?('noun')
      word.gsub('noun', words[:noun])
    elsif word.match?(/^verb/)
      word.gsub('verb', words[:verb])
    elsif word.include?('adjective')
      word.gsub('adjective', words[:adjective])
    elsif word.include?('adverb')
      word.gsub('adverb', words[:adverb])
    else
      word
    end
  end
  puts result.join(' ')
end

words = {noun: '', verb: '', adjective: '', adverb: ''}
sentence = "Do you verb your adjective noun adverb? That's hilarious!"

prompt("Enter a noun")
words[:noun] = gets.chomp
prompt("Enter a verb")
words[:verb] = gets.chomp
prompt("Enter an adjective")
words[:adjective] = gets.chomp
prompt("Enter an adverb")
words[:adverb] = gets.chomp

print_sentence(sentence, words)