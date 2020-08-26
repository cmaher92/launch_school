# Problem: Encrypted Pioneers

# The following list contains the names of individuals who are pioneers in the
# field of computing or that have had a significant influence on the field.
# The names are in an encrypted form, though, using a simple
# (and incredibly weak) form of [[encryption]] called [[Rot13]].

# Write a program that deciphers and prints each of these names .

ENCRYPTED_NAMES = [
  Nqn Ybirynpr,
  Tenpr Ubccre,
  Nqryr Tbyqfg var,
  Nyna Ghevat,
  Puneyrf Onoontr,
  Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv,
  Wbua Ngnanfbss,
  Ybvf Unvog,
  Pynhqr Funaaba,
  Fgrir Wbof,
  Ovyy Tngrf,
  Gvz Orearef-Yrr,
  Fgrir Jbmavnx,
  Xbaenq Mhfr,
  Fve Nagbal Ubner,
  Zneiva Zvafxl,
  Lhxvuveb Zngfhzbgb,
  Unllvz Fybavzfxv,
  Tregehqr Oynapu
]

# input:
#   - array of encrypted strings
# output:
#   - array of decrypted strings
# rules/constraints:
#   - don't touch characters that aren't letters
#   - case sensitive
# test input/output
#   -
# algorithm/data structure:
#   - create an array of lowercase letters
#   - for each letter
#     - set shift to 13
#     - set index to index of letter on lowercase letters array
  #   - loop over array of lowercase letters until shift == 0
    #   - set index to 0 if index == 26
    #   - index + 1
    #   - shift - 1
