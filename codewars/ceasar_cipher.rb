=begin
input
string - s, that needs coding
int - shift, the number for the initial shift
output
arr - string split into fifths such that the first four arrays must try to be
equal length, and then the rest can go in the fifth array as long as it's
not longer than the first

init coded array
init a constant for the alphabet hash, the key's will be the letter values 1-26
  - given the string, split into an array of chars
  - now take all of the characters and map them to their associated letter_value
    using the ALPHABET hash, then take the value and add the shift, divmod and
    the remainder of the divmod should become the value
    - if the value is a ' ' make sure to set the value to 0
  - now that we have an array of values, map each value to the ALPHABET to get
    the now coded character
    - if the value is 0, set the character to a space
  - join the array of coded characters back together and return


divide the string into five arrays
=end

ALPHABET = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

def shift_arr(characters, shift)
  count = shift
  characters.map! do |val|
    if val == ' '
      count += 1
      next val
    end

    val = val + count
    if val > 25
      val = val % 25
    end

    count += 1
    ALPHABET[val]
  end
end

def codeString(s, shift)
  # maps each letter to it's index-value
  # shifts each letter based on the given shift
  # joins the array and returns the coded string
  characters = s.chars

  # maps each letters to it's index-value
  characters.map! do |char|
    if char == ' '
      next ' '
    else
      ALPHABET.index(char)
    end
  end

  # handles the shift
  characters = shift_arr(characters, shift)

  characters.join
end


def movingShift(s, shift)
  coded_str = codeString(s, shift)
end



def demovingShift(str, shift)
  values = str.chars.map do |char|
    if char == ' '
      next char
    end
    ALPHABET.index(char)
  end


  count = shift
  values.map! do |val|
    if val == ' '
      count += 1
      next val
    else
      val >= count ? val = val - count : val = val - (count + 1)
      count += 1
      ALPHABET[val]
    end
  end

  values.join
end

coded_str = movingShift('my name is connor', 2)
p demovingShift(coded_str, 2)
