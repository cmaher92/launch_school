# lettercase counter
# easy_7
# problem_2

# input: string
# output: hash, keys (:lowercase, :uppercase, :neither)
# rules:
#   - :lowercase, # of chars that are lowercase
#   - :uppercase, # of chars that are uppercase
#   - :neither, # of chars that are neither
#   - value is 0 by default
# algorithm:
#   - create a hash with appropriate keys
#   - str.count, for each value

def letter_case_count(str)
  letter_case_counts = { lowercase: 0, uppercase: 0, neither: 0 }

  str.each_char do |chr|
    if chr.match?(/[A-Z]/)
      letter_case_counts[:uppercase] += 1
    elsif chr.match?(/[a-z]/)
      letter_case_counts[:lowercase] += 1
    else
      letter_case_counts[:neither] += 1
    end
  end

  letter_case_counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }