# shuffle array method
# extend the built in array class

require = 'pry'

class Array
  def shuffle
    shuffled_array = []
    length_int = self.length
    self.each do |item|
      random_number = rand(self.length)
      while shuffled_array[random_number] != nil
        random_number = rand(self.length)
      end
        shuffled_array[random_number] = item
    end
    return shuffled_array
  end
end

unshuffled_array = ['megan', 'connor', 'avery']
puts unshuffled_array.shuffle
