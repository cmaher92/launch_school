# ALPHABET = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)


# def calculate_shift(char)
#   value = ALPHABET.index(char.downcase) + 13
#   value > 25 ? value % 25 - 1 : value
# end

# def rot13(str)
#   arr = str.split(//)
#   arr.map! do |char|
#   # leaves the character alone if it's not a letter
#     next char if char.match(/[^A-Za-z]/) != nil
    
#     upcased = false
#     upcased = true if char == char.upcase
    
#   # calculates the shift
#     value = calculate_shift(char)
#     p value
    
#     if !upcased
#       ALPHABET[value]
#     else
#       ALPHABET[value].upcase
#     end
#   end
#   p arr.join
# end

# The top solution
# Takes,
# ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
# Replaces with,
# NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm
def rot13(string)
  string.tr("A-Za-z", "N-ZA-Mn-za-m")
end

p rot13('test')