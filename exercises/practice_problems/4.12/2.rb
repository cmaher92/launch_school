# What is returned?
hash = { connor: 28, megan: 24, avery: 20, skylar: 22 }
p hash.map { |k, v| [k, v] }

# answer
# hash is unchanged
# hash#map returns an arry of items that are returned by the block
# => [[:connor, 28], [:megan, 24], [:avery, 20], [:skylar, 22]]