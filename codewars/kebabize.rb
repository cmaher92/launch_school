def kebabize(str)
  # given a str that is camel-cased
  # split the str before each capital letter
  # init words []
   # match the capital, which returns the index of the first capital found
   # slice and append from the 0, to the index of the capital - 1
   # downcase the returned index from the match
  # append the remaining str to the arr
  words = []
  match = 0
  loop do
    match = str =~ /[A-Z]/
    break if match == nil
    str[match] = str[match].downcase
    words << str.slice!(0, match - 1)
  end
  words << str
  p words
end

kebabize('myNameIsConnor')

# Modify the kebabize function so that it converts a camel case string into a kebab case.
# the returned string should only contain lowercase letters
=begin
  Lower case in result
  algo iterate through each letter, compare exiting with the uppercase version
  and if they match then
  insert '-' before that index
  lowercase that letter

  join the chars together

=end

# def kebabize(str)
#   str_char = str.chars
#   kebab_str = []

#   str_char.each do |char|
#     char.eql?(char.upcase) ? kebab_str << "-" + char.downcase : kebab_str << char
#   end
#   kebab_str.join
# end

# p kebabize('camelsHaveThreeHumps') # camels-have-three-humps
# p kebabize('camelsHave3Humps')     # camels-have-humps
