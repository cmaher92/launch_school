# combinging arrays

# input: 2 arrays
# output: array
# rules:
#   - output is combination of first two arrays
#   - no duplication values
#   - what if arrays are different sizes
#   - what if one array is empty
#   - if I use one of the arrays as the new_array will that affect og object
# algoirthm:
#   

def merge(ary1, ary2)
  new_array = []
  [ary1, ary2].each do |ary|
    ary.each { |v| new_array << v unless new_array.include?(v) }
  end
  new_array
end

ary1 = [1, 3, 5]
ary2 = [3, 6, 9]
p merge(ary1, ary2)
p ary1.object_id
