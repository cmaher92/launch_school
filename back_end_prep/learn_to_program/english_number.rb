# English number

# Method that takes an int and returns the English representation of that
# int

# TODO:
# Put in thousands, instead of 'ten hundred'         should be  'one thousand'
#                   instead of 'one hundred hundred' should be  'ten thousand'

# TODO:
# Put in millions, instead of 'one thousand thousand' should be 'one million'

# TODO:
# Add billions, trillions and so on.

require 'Pry'

def english_number number
  if number < 0
    return 'Please enter a number that isn\'t negative'
  end
  if number == 0
    return 'zero'
  end
  num_string = '' # This is the string that will be returned
  ones_place = ['one',      'two',     'three',
                'four',     'five',    'six',
                'seven',    'eight',   'nine']

  tens_place = ['ten',      'twenty',  'thirty',
                'forty',    'fifty',   'sixty',
                'seventy',  'eighty',  'ninety']

  teens      = ['eleven',   'twelve',  'thirteen',
                'fourteen', 'fifteen', 'sixteen',
                'seventeen','eighteen','nineteen']

  # "left"   is how much of the number
  #          we still have left to write out.
  # "write"  is the part we are currently
  #          writing out
  left = number
  write = left/100            # How many hundreds left?
  left = left - write*100     # Subtract off those hundreds

  if write > 0
    # Recursion:
    hundreds = english_number write
    num_string = num_string + hundreds + ' hundred'
    if left > 0
      # So we don't write 'two hundredfifty-one'...
      num_string = num_string + ' '
    end
  end

  write = left/10             # How many tens left?
  left = left - write*10      # Subtract off those tens.

  if write > 0
    if ((write == 1) and (left > 0))
      # since we can't write tenty-two instead of
      # "twelve", we make a special exception for these
      num_string = num_string + teens[left-1]
      # The "-1" is because teenagers[3] is 'fourteen', not 'thirteen'.
      # since we took care of the digit in the ones place already,
      # we have nothing left to write
      left = 0
    else
      num_string = num_string + tens_place[write-1]
      # The "-1" is because tens_place[3] is forty not thirty.
    end
    if left > 0
      # so we don't write 'sixtyfour'...
      num_string = num_string + '-'
    end
  end

  write = left # How many ones left to write out?
  left = 0     # Subtract off those ones.
  if write > 0
    num_string = num_string + ones_place[write-1]
    # the "-1" is because ones_place[3] is 'four', not 'three'
  end
  # now we just return 'num_string'...
  num_string
end

# puts english_number(  0)
# puts english_number(  9)
# puts english_number( 10)
# puts english_number( 11)
# puts english_number( 17)
# puts english_number( 32)
# puts english_number( 88)
# puts english_number( 99)
# puts english_number(100)

puts english_number(101)
puts english_number(233)
puts english_number(3211)
puts english_number(999999)
puts english_number(1000000000000)
