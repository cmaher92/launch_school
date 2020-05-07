# Complete the function/method so that it takes CamelCase string and returns the string 
# in snake_case notation. Lowercase characters can be numbers. 
# If method gets number, it should return string.

# input:
#   - String: CamelCased
# output:
#   - String: snake_case
# constraints:
#   - lowercase characters can be numbers
#   - if method receives number, should return string
# mental model:
#   - create new result string
#   - ensure passed in string is a string
#   - iterate through string until hitting upcased letter with last letter being lowercased letter
#     - add underscore to new string
#     - downcase current letter and add to new string
#     - continue
# algorithm/data structure:
#   -
require 'pry'

def to_underscore(str)
  str = str.to_s
  new_str = ''
  idx = 0
  while idx < str.length
    if str[idx].ord.between?(65, 90) && !idx.zero? && (str[idx - 1].ord.between?(97, 122) || str[idx - 1].ord.between?(48, 57))
      # if it's a capital, idx isn't 0, and the last character was lowercase
      # place underscore and downcased character into new string
      new_str << '_' + str[idx].downcase
      idx += 1
    else
      new_str << str[idx].downcase
      idx += 1
    end
  end
  new_str
end

# Examples:
# returns test_controller
p to_underscore('TestController')

# returns movies_and_books
p to_underscore('MoviesAndBooks')

# returns app7_test
p to_underscore('App7Test')

# returns "1"
p to_underscore(1)

p to_underscore('AAA')

p to_underscore('ThisHHHasManyCapitals')

p to_underscore('CSSSelector')
