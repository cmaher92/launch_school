LETTER_VALUE = {
  'a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5, 'f' => 6,
  'g' => 7, 'h' => 8, 'i' => 9, 'j' => 10, 'k' => 11, 'l' => 12,
  'm' => 13, 'n' => 14, 'o' => 15, 'p' => 16, 'q' => 17, 'r' => 18,
  's' => 19, 't' => 20, 'u' => 21, 'v' => 22, 'w' => 23, 'x' => 24,
  'y' => 25, 'z' => 26
}

def rank(st, we, n)
    return 'No participants' if st.empty?
    st = st.split(',')
    return 'Not enough participants' if n > st.length
    values = st.map.with_index do |name, idx|
      name_chars = name.chars
      value = name_chars.reduce(0) do |sum, char|
        char = LETTER_VALUE[char.downcase]
        sum + char
      end
      {name => (value + name.length) * we[idx]}
    end

    sorted_values = values.sort_by { |name| name.values }
    sorted_values.map! { |name| name.to_a }
    sorted_values[n - 1][0][0]
end

# Test cases
st = "COLIN,AMANDBA,AMANDAB,CAROL,PauL,JOSEPH"
we = [1, 4, 4, 5, 2, 1]
n  = 4

p rank(st, we, n)

st = ""
we = [1, 2, 3, 4, 5]
n  = 3

p rank(st, we, n)

st = "COLIN,AMANDBA,AMANDAB,CAROL,PauL,JOSEPH"
we = [1, 4, 4, 5, 2, 1]
n  = 9

p rank(st, we, n)
