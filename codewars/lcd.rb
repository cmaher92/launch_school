require 'pry'

def convert_fracts(arr)
  denominators = []
  
  arr.each do |subarr|
    denominators << subarr[1]
  end
  
  lcm = find_lcm(denominators)
end

def find_lcm(arr)
    lcm = 1
    loop do
      results = arr.map do |denom|
        lcm % denom == 0
      end
      break if results.all? { |b| b == true }
      lcm += 1
    end
  lcm
end

convert_fracts([[1, 2], [1, 3], [1, 4]]) # [6, 12], [4, 12], [3, 12]

# solution
def convertFracts(lst)
  lcm = lst.reduce(1) { |x,y| x.lcm(y[1]) }
  lst.map { |x| [lcm/x[1]*x[0], lcm] }
end