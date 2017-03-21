# Dictionary Sort

require 'pry'

arr = %w( Con meg Ave dad Mom )

def dictionary_sort(arr)
  if arr.length <= 1
    return arr
  end

  middle = arr.pop
  less   = arr.select { |item| item.downcase < middle.downcase }
  more   = arr.select { |item| item.downcase > middle.downcase }
  dictionary_sort(less) + [middle] + dictionary_sort(more)
end

p dictionary_sort(arr)
