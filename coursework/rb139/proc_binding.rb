def exclaim(array, block)
  value = '!'
  array.map(&block)
end

value = '!!!'

new_proc = Proc.new  { |n| n + value  }

value = '...'

p exclaim(["hi", "bye"], new_proc)
