# capitalize words
# easy_7
# problem_3

# input: string
# output: string
# rules: 
#   outputted string has first letter of each word capitalized
#   words are any sequence of non-blank characters
#   word may begin with quotes, so not able to capitalize

# algorithm:
#   split string into words
#   iterate over each word, capitalizing first letter
#   join & return

# algorithm: solving without using #capitalize
#   split string into words
#   create hash containing mapped letters
#   

# def word_cap(str)
#   str.split.each_with_object([]) { |word, arr| arr << word.capitalize }.join(' ')
# end

def downcase_word(str)
  uppercase_to_lowercase = ('A'..'Z').to_a.map { |letter| [letter, letter.downcase] }.to_h
  str.split(//).map do |c|
    uppercase_to_lowercase.include?(c) ? uppercase_to_lowercase[c] : c 
  end.join
end

def word_cap(str)
  lowercase_to_uppercase = ('a'..'z').to_a.map { |letter| [letter, letter.capitalize] }.to_h

  str.split.each_with_object([]) do |word, arr|
    if lowercase_to_uppercase.keys.include?(word[0])
      word[0] = lowercase_to_uppercase[word[0]]
    end
    word = word[0] + downcase_word(word[1..-1])
    arr << word
  end.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
