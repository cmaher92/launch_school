=begin
Staggered Caps (Part 2)

Modify the method from the previous exercise so it ignores non-alphabetic 
characters when determining whether it should uppercase or lowercase each letter. 
The non-alphabetic characters should still be included in the return value; 
they just don't count when toggling the desired case.

given a string transform to arr
iterate over the arr
  if boolean is true then flip unless char.match(/[^A-Za-z]/)
  if boolean is false then flip unless char.match(/[^A-Za-z]/)
  flip boolean
join the arr and return
=end
require 'pry'

# quick edit to add an iff statement based on if the caller
# wants to count non-alphabetic when stagger-casing the string
def stagger(str, count_non_alphabetic)
  upper = true
  str.chars.map do |char|
    if count_non_alphabetic
      next char if char.match?(/[^a-z]/i)
    end
    if upper == true
      upper = !upper
      char.upcase
    else
      upper = !upper
      char.downcase
    end
  end.join
end

p stagger('I Love Launch School!', false) #== 'I lOvE lAuNcH sChOoL!'
#p stagger('ALL CAPS') == 'AlL cApS'
#p stagger('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'