require 'pry'

LETTER_VALUE = {
  'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6,
  'g' => 7, 'h' => 8, 'i' => 9, 'j' => 10, 'k' => 11, 'l' => 12,
  'm' => 13, 'n' => 14, 'o' => 15, 'p' => 16, 'q' => 17, 'r' => 18,
  's' => 19, 't' => 20, 'u' => 21, 'v' => 22, 'w' => 23, 'x' => 24,
  'y' => 25, 'z' => 26
}

def rank(st, we, n)
    # input
    # st - string of firstnames
    # we - an array of weights
    # n  - 4, the winning name is in the 4th position
    # output
    # string - winning name
    # rules
    #  if st is empty return "No participants"
    #  if n is greater than the number of participants return "Not enough participants"

    # given a string of firstnames, split the names on the comma
    # map each name in the array of names returned from the split function
    #   name = 'COLIN'
    #   split the name into chars
    #   name = ['C', 'O', 'L', 'I', 'N']
    #   reduce the char array passing sum, and char
    #     sum = 0, char = 'C'
    #     first convert the letter to a number using the LETTER_VALUE constant
    #     char = 3
    #     then return sum + char_value
    #     0 + 3
    #   return the value returned from the reduce method to the map method
    st = st.split(',')
    values = st.map.with_index do |name, idx|
      name_chars = name.chars
      value = name_chars.reduce(0) do |sum, char|
        char = LETTER_VALUE[char.downcase]
        sum + char
      end
      {name => (value + name.length) * we[idx]}
    end

    # sort the array by the value in each hash
    values = values.map { |hash| binding.pry hash.to_a }
    binding.pry
end

st = "COLIN,AMANDBA,AMANDAB,CAROL,PauL,JOSEPH"
we = [1, 4, 4, 5, 2, 1]
n  = 4

rank(st, we, n)
