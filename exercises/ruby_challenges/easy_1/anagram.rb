class Anagram
  def initialize(str)
    @anagram = str
    @sorted = str.downcase.split(//).sort
  end
  
  def match(arr)
    arr.select do |word| 
      sorted = word.downcase.split(//).sort
      sorted == @sorted unless word.downcase == @anagram.downcase
    end
  end
end

# detector = Anagram.new('Orchestra')
# p detector.match %w(cashregister Carthorse radishes)