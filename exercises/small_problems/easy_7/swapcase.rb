# swap case
# easy_7
# problem_4

# input: string
# output: new string
# rules:
#   - every uppercase letter is replaced by its lowercase version
#   - every lowercase letter is replaced by its uppercase version
#   - all other characters should not be changed

# algorithm:
#   split string into characters
#   #ord each character
#     # if it's between 65-90, add 32
#       Integer#chr to go back
#     # if it's between 97-122, subtract 32
#       Int#chr to go back to string
#     # else, no change

def swapcase(str)
  str.split(//).map do |chr|
    chr = chr.ord
    if chr.between?(65, 90)
      (chr + 32).chr
    elsif chr.between?(97, 122)
      (chr - 32).chr
    else
      chr.chr
    end
  end.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'