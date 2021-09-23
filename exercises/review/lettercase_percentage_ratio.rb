# lettercase percentage ratio
# set: small problems/med. 2
# date: 09/23/2021

# input: string
# output: hash
#   - lowercase: float; percentage of lowercase chars
#   - uppercase: float; percentage of uppercase chars
#   - neither: float: percentage of chars that are not alphabetic

# rules:
# - string will always contain at least one char

# questions:

# algorithm:
# - instantiate an array with 0 as the default value, assigned to 'counts'
# - check each character:
#   - if that character's ASCII ordinal value between 97..122 increment first value
#   - if value between 65..90 increment second value
#   - else
#       - increment third value
# - calculate percentages
#   - map counts converting from counts to an array of arrays containing

def to_percentages(counts)
    counts.map do |num|
        num.zero? ? num.to_f : (num / counts.sum.to_f) * 100
    end
end

def letter_percentages(str)
    counts = [0, 0, 0]

    str.each_char do |char|
        case char.ord
        when 97..122 then counts[0] += 1
        when 65..90  then counts[1] += 1
        else              counts[2] += 1
        end
    end

   [:lowercase, :uppercase, :neither].zip(to_percentages(counts)).to_h
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }