
# My attempt at the english number problem

def english_number number
  ones = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  teens = ['eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
  tens = ['ten', 'twenty', 'thirty', 'fourty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety']

  if number == 0
    return 'zero'
  end
  if number < 0
    puts "Please use a number that is greater than zero"
  end
  
  left = number
  write = left/100
  left = left - write*100

  num_string = ""
  if write > 0
    hundreds = english_number write
    num_string = num_string + hundreds + " hundred"
    if left > 0
      num_string = num_string + " "
    end
  end

  write = left/10
  left = left - write*10
  if write > 0
    if ((write == 1) and (left > 0))
      num_string = num_string + teens[left-1]
      left = 0
    else
      num_string = num_string + tens[write-1]
    end
    if left > 0
      num_string = num_string + " "
    end
  end

  write = left/1
  left = 0
  if write > 0
    num_string = num_string + ones[write-1]
  end
  return num_string 
end

puts english_number 29
