=begin
  Given an array of primitive values, return an array of subarrays, where each sub array contains all duplicates of a specific value in the original array.

  Example: method([1,2,3,'a',1,3,'b', 'a'])
    => [[1,1],[2], [3,3],['a','a'], ['b']]

given an arr of elements
put elements into a hash and increment their values
then create a subarray for each key, the number of values determines
the number of keys

=end

def subarrify(arr)
  hash = Hash.new(0)
  results = []
  arr.each do |obj|
    hash[obj] += 1
  end
  # create a hash of the keys
  # map each item of the arr to a subarray with the items * values
  keys = hash.keys
  keys.map! do |key|
    result = []
    value = hash[key]
    until value == 0
      result << key
      value -= 1
    end
    result
  end
  p keys
end

subarrify([1,2,3,'a',1,3,'b', 'a'])
subarrify([])
