# How Many?

# Write a method that counts the number of occurrences of each element in a 
# given array.

vehicles = 
['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle',
'car', 'truck']

# Given an array of strings representing vehicles

# - create a hash
# Iterate over the vehicles collection one by one
#     - if the vehicle is in the hash
#         - iterate the value by 1
#     - else 
#         - create the key and iterate the value by 1

# iterate over the newly created vehicle hash
# print each key and value

# START
# SET vehicle_count = Hash.new
# 
# FOR each vehicle 
# IF vehicle_count[vehicle] == nil
#   vehicle_count[vehicle] = 1
# Else
#   vehicle_count[vehicle] += 1
# 
# FOR each vehicle_count
#   PRINT each key and value
# 
# END

def count_occurrences(vehicles)
    vehicle_count = Hash.new
    
    vehicles.each do |vehicle|
        if vehicle_count[vehicle] == nil
            vehicle_count[vehicle] = 1
        else
            vehicle_count[vehicle] += 1
        end
    end
    
    vehicle_count.each do |vehicle, count|
        puts "#{vehicle} => #{count}"
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
