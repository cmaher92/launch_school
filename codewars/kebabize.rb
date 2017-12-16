def kebabize(str)
  letters = []
  str.chars.each_with_index do |char, idx|
    if char == char.upcase
      letters << '-'
      letters << char.downcase
    else
      letters << char unless char.match(/[^a-z]/i)
    end
  end
  letters.join
end

p kebabize('myNameIsConnor')

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
