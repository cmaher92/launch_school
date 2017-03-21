# Quick Sort example
arr = %w( cat dog fred connor avery megan maher kyle king )

def sort(arr)
  return arr if arr.length <= 1
  middle = arr.pop
  less   = arr.select { |x| x < middle }
  more   = arr.select { |x| x > middle }
  sort(less) + [middle] + sort(more)
end

p sort(arr)


# middle = 'king'
# less   = ["cat", "dog", "fred", "connor", "avery"]
# more   =["megan", "maher", "kyle"]

# sort( ["cat", "dog", "fred", "connor", "avery"] )
#
