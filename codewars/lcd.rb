require 'pry'

def convert_fracts(arr)
  denominators = []
  common_found = false
  
  arr.each do |subarr|
    denominators << subarr[1]
  end
  
  find_lcd(denominators)
end

def find_lcd(arr)
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