# 16
# Create a UUID

#  It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# input:
# output: String
# rules:
#   - UUID consists of 32 hexadecimal characters
#   - Broken up into 5 sections
#     - 8-4-4-4-12
#   - '-' used to delimit the different sections
#

# algorithm:
#   - create array of 32 hexadecimal characters
#     - init empty array
#     - 32.times
#       - choose a random number from 0..15
#       - conver to hex string
#       - append to array
#   - create string
#     - init array of [8, 4, 4, 4, 12]
#     - iterate over array, shifting n from the array
#     - append the return values and a '-'
#       - unless the return values size is 12, don't append the dash

def create_hex_arr(size)
  hex = []
  size.times { hex << rand(0..15).to_s(16) }
  hex
end

def create_uuid
  hex_arr = create_hex_arr(32)

  uuid = [8, 4, 4, 4, 12]
  uuid = uuid.map do |num| 
    num < 12 ? hex_arr.shift(num).join + '-' : hex_arr.shift(num).join
  end
  uuid.join
end

uuid = create_uuid
p uuid.length == "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91".length