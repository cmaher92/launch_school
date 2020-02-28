# How Many?

# Write a method that counts the number of occurrences of each element in a
# given array.

vehicles =
['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle',
'car', 'truck']

# make an array of vehicles with only the uniq elemenets in the array
# for each item of the uniq array
# count the number of occurances and print the output

def count_occurrences(vehicles)
  vehicles.uniq.each do |vehicle|
    puts "#{vehicle}, #{vehicles.count(vehicle)}"
  end
end




# Test cases
count_occurrences(vehicles)
# Once counted, print each element alongside the number of occurrences.

# Expected output:
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
