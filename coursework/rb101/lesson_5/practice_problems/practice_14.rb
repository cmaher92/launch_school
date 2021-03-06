# Practice Problem 14
# Given this data structure write some code to return an array containing the
# colors of the fruits and the sizes of the vegetables.
# The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

# The return value should look like this:
# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# iterate over the hash with an object
  # if fruit, add the colors to object
  # otherwise, add the size to object

colors_and_size = hsh.each_with_object([]) do |(k, v), arr|
  if v[:type] == 'fruit'
    arr << v[:colors].capitalize
  else
    arr << v[:size].upcase
  end
end

p colors_and_size
