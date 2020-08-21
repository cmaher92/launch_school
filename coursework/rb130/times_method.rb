# calling object is an integer
# executes n number of times
# yields block n number of times
# - begins at 0
# - ends at n-1

def times(n)
  [*0...n].each do |num|
    yield(num)
  end
  
  n
end

times(5) { |num| puts num }