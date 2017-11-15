# Example of a block
# taken from Chris Pine's book
# Used for review

def do_until_false first_input, some_proc
  input = first_input # [5]
  output = first_input # [5]
  
  while output
    input = output # [25, 16, 9, 1, 0]
    output = some_proc.call # false
  end
  
  input # [25, 16, 9, 1, 0]
end

build_array_of_squares = Proc.new do |array|
  last_number = array.last # 5
  if last_number <= 0 
    false
  else
    # Take off the last number...
    array.pop
    # ...and replace it with its square...
    array.push last_number*last_number
    # ...followed by the next smaller number.
    array.push last_number-1
  end
end

always_false = Proc.new do |just_ignore_me|
  false
end

puts do_until_false([5], build_array_of_squares).inspect