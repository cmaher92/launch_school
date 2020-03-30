def oddities(arr, odd=true )
  odd ? arr.select { |item| arr.index(item).even? } : arr.select { |item| arr.index(item).odd? } 
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

p oddities([1, 2, 3], false) == [2]