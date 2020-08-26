# Problem: Encrypted Pioneers

# The following list contains the names of individuals who are pioneers in the
# field of computing or that have had a significant influence on the field.
# The names are in an encrypted form, though, using a simple
# (and incredibly weak) form of [[encryption]] called [[Rot13]].

# Write a program that deciphers and prints each of these names .

ENCRYPTED_NAMES = [
  "Nqn Ybirynpr",
  "Tenpr Ubccre",
  "Nqryr Tbyqfg var",
  "Nyna Ghevat",
  "Puneyrf Onoontr",
  "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
  "Wbua Ngnanfbss",
  "Ybvf Unvog",
  "Pynhqr Funaaba",
  "Fgrir Wbof",
  "Ovyy Tngrf",
  "Gvz Orearef-Yrr",
  "Fgrir Jbmavnx",
  "Xbaenq Mhfr",
  "Fve Nagbal Ubner",
  "Zneiva Zvafxl",
  "Lhxvuveb Zngfhzbgb",
  "Unllvz Fybavzfxv",
  "Tregehqr Oynapu"
]

# input:
#   - array of encrypted strings containing both letters and non-letters
# output:
#   - array of decrypted strings, representing influential computer
#     scientists
# rules/constraints:
#   - case sensitive
#   - will contain non-letters and spaces
# test input/output
#   -
# algorithm/data structure:
#   - iterate over each string in the array
#   - for each mapped character within the string
#     - decyrpt
#   - return mapped array

#   - decypt
#   - given a character
#   - if character is between a...m or A...M convert to ord and add 13,
#     convert back to char and return #ord, #chr
#   - if character is between n..z or N..Z convert to ord and subtract 13
#     convert back to char and return
#   - otherwise, just return

def decrypt(char)
  case char.downcase
  when 'a'..'m'
    (char.ord + 13).chr
  when 'n'..'z'
    (char.ord - 13).chr
  else
    char
  end
end

def decypher(names)
  names.map do |name|
    decrypted_name = ''
    name.each_char { |char| decrypted_name << decrypt(char) }
    decrypted_name
  end
end

puts decypher(ENCRYPTED_NAMES)
# p decrypt('N') == 'A'
# p decrypt('n') == 'a'
# p decrypt('a') == 'n'
# p decrypt('-') == '-'
# p decrypt(' ') == ' '
