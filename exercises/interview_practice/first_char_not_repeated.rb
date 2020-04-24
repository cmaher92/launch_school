# Input: string
# Output: String; first character that's not repeating
# Rules:
#   - first character seen that's count is only 1
#   - case insensitive; but should return the correct case
#   - if a string only contains repeating characters, return empty string
# Algo:
#   - group characters by count
#   - return the character that appears with the lowest index
#     - sort the array by the position they appear in the passed in string
#     - return the first element of the sorted array
require 'pry'

def first_non_repeating_letter(str)
  grouped = str.chars.group_by { |char| str.downcase.count(char.downcase) }
  one_counts  = grouped.values_at(1).first
  return '' if one_counts.nil?
  one_counts.sort_by { |char| str.index(char) }.first
end

p first_non_repeating_letter('a')
p first_non_repeating_letter('sTreSS')
p first_non_repeating_letter('moonmen')
p first_non_repeating_letter('aabbcc')
p first_non_repeating_letter('')