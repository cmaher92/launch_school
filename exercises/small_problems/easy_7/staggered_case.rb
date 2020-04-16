# staggered caps
# easy_7
# problem_4

# input: string
# output: string
# rules:
#   - every other letter is capitalized
#   - characters that aren't letters shouldn't be changed but still count as characters when switching
#     between upper and lowercase

# algorithm:
#  upcase_char
#  - if it's between 97, 122
#    - subtract 32, return it after converting back to char
#  - else
#    - return itself

# downcase_char
#   if it's between 65, 90
#     - add 32, convert, return
#   else
#     - return char

# staggered_case
#   split string into characters
#   map the string, with index (each_with_index.map)
#     - if index is even, upcase
#     - otherwise, downcase
#   join string, and return

def downcase_char(char)
  char.ord.between?(65, 90) ? (char.ord + 32).chr : char
end

def upcase_char(char)
  char.ord.between?(97, 122) ? (char.ord - 32).chr : char
end

def staggered_case(str)
  str.chars.each_with_index.map { |char, i| i.even? ? upcase_char(char) : downcase_char(char) }.join
end

# tests for helpers
# p upcase_char('a')
# p downcase_char('A')
# p downcase_char('a')
# p upcase_char('A')
# p downcase_char("!")
# p upcase_char("!")

# tests
p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'