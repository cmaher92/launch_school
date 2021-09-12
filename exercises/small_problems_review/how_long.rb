# how_long.rb

# input
# - string
# output
# - array that contains:
#   every word from the string + a space + the length of the word

# rules
# - assume words in string separated by exactly one space
# - any substring of non-space characters is a word


# algorithm ------
# define a string named word
# define an array named words
# define an int named length

# guard for empty string

# iterate over str
# - if substring is not a space character
#   - append to word
#   - increment length
# - if substring is space character
#   - append a space to word
#   - convert length to a string and append to word
#   - append word to words
#   - reset length to 0
#   - reset str

# append space to word
# append length as string to word
# append word to words

# return array of words

def word_lengths(str)
  word   = ''
  words  = []

  str.each_char do |char|
    if char != ' '
      word << char
    elsif char == ' '
      words << "#{word} #{word.size}"
      word = ''
    end
  end

  words << "#{word} #{word.size}" unless word.empty?
  words
end

# def word_lengths(string)
#   words = string.split

#   words.map do |word|
#     word + ' ' + word.length.to_s
#   end
# end

# examples
p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
p word_lengths("baseball hot dogs and apple pie") == ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
p word_lengths("Supercalifragilisticexpialidocious") == ["Supercalifragilisticexpialidocious 34"]
p word_lengths("") == []
