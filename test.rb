def square_array_in_place(int_array)
  int_array.each_with_index do |element, index|
    int_array[index] *= element
  end

  nil
end

arr = [1, 2, 3, 4]
square_array_in_place(arr)
p arr