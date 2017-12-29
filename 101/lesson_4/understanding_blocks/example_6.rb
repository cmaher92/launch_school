[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

# method call (all?), object is an array of hashes, returns the selected hashes
#   in a new array
# block execution, object is each hash within the original array, no side effect,
#   return value is a boolean, boolean used by select
# method call (all?), object calling is a hash, return value is a boolean, used by
#   block execution
# block execution, object is the key, value within the hash, no side-effect,
#   return value is a boolean, used by #all to determine if all of the keys in the
#   hash have the same first letter as all of the values in the hash
# method call (to_s), object is the key of the hash, no side-effect, return value
#   is the key as a string, used for comparison
# method call (#[]), object is the value. no side-effect, return value is the first
#   letter of the value
# comparison, n/a, no side-effect, return value is a boolean, return value used
#   by the block execution

# If #any was used instead of #all within the block passed to the #select method
#   then both hashes within the array would be kept, and returned. 
