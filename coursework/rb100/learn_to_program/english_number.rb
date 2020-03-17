# Wedding number
# Include 'Pry"

  def english_number number
  if number < 0
    return 'Please enter a number that isn\'t negative.'
  end
  if number == 0
    return 'zero'
  end
 
  num_string = ''  # This is the string we will return.
 
  ones =       ['one',     'two',       'three',    'four',     'five',
               'six',     'seven',     'eight',    'nine']
  tens =       ['ten',     'twenty',    'thirty',   'forty',    'fifty',
               'sixty',   'seventy',   'eighty',   'ninety']
  teenagers =  ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']
  
  left = number
  write = left/1000
  left = left - write*1000
  
  if write > 0
  	thousands = english_number write
  	num_string = num_string + thousands + ' thousand'
  	if left > 0
  		num_string = num_string + ' '
  	end
  end
  
  write = left/100
  left = left - write*100
  if write > 0
  	hundreds = english_number write
  	num_string = num_string + hundreds + ' hundred'
  	if left > 0
  		num_string = num_string + ' '
  	end
  end

  write = left/10
  left = left - write*10
if write > 0
  if ((write == 1) and (left > 0))
      num_string = num_string + teenagers[left-1]
      left = 0
  else
      num_string = num_string + tens[write-1]
  end

  if left > 0
    num_string = num_string + '-' 
  end
end

write = left
left = 0

if write > 0
  num_string = num_string + ones[write-1]
end

return num_string
end
