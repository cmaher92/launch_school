# staggered_caps

# input
# => string
# output
#   new string that contains the original value using a
#   staggered capitalization scheme, where every other char
#   is capitalized
#   remaining characters are lowercase
#   every other character should be capitalized


# set a boolean which will decide if the first or second element will be upcased
# set a count
# results = ""
# change the string to an arr
# loop over the array
# break when the count is equal to the length of the str
# if upper then then upcase the element & push to string
# otherwise downcase element & push to string
# flip the boolean
# increment the count
# return the results str

# further exploration
def staggered_case(str, upper)
  results = ""
  str.chars.each do |char|
    upper ? results << char.upcase : results << char.downcase
    upper = !upper
  end
  results
end

p staggered_case('I Love Launch School!', false)
#p staggered_case('ALL_CAPS') == 'AlL_CaPs'
#p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'