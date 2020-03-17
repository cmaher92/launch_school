# Feature request 1
# Write a method called joinor that will produce the following result:

# input
#   Array of integers
#   Optional string which represents the delimiter
#   Optional string which defines what seperates the last two numbers
# output
#   String of available options, seperated by the optional delimiter and
#   the final word to seperate the last 2 integers

# given an array of numbers
# create a string
# if the array is less than 2, the string should only contain the single num
# if the array is exactly 2, the string should only contain the conjunction
# if the array is more than 2, the string should be delimited by the defined
#   delimiter except for the last two which are seperated by the conjunction

# define a function that takes an array
#   an optional delimiter
#   and an optional conjunction
# if the length of the array is < 1,
#   just add the num to the string and return
# if the length of the array is 2,
#   join the array with the conjunction and return
# otherwise, join from the 0 index to the -3 index with the delimiter
#   add to array_of_strings
# join[-2..-1] with the conjunction and append the string to the
#   array_of_strings
# join the array_of_strings with the defined delimiter and return

def joinor(arr, delimiter = ', ', conjunction = 'or')
  array_of_strings = []
  if arr.size == 1
    arr[0].to_s
  elsif arr.size == 2
    arr.join(" #{conjunction} ")
  else
    array_of_strings << arr[0..-3].join("#{delimiter}")
    array_of_strings << arr[-2..-1].join("#{delimiter}#{conjunction} ")
    array_of_strings.join("#{delimiter}")
  end
end

# test cases
# p joinor([1, 2])          == "1 or 2"
# p joinor([1, 2, 3])       == "1, 2, or 3"
# p joinor([1, 2, 3], '; ') == "1; 2; or 3"
# p joinor([1, 2, 3], ', ', 'and') == "1, 2, and 3"
