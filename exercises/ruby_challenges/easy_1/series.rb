# class series
  # takes a string of digits
  # slices(n)
    # returns array of arrays
    # keeps order of @series
    # raise ArgumentError if n > size of @series
 
class Series
  def initialize(str)
    @series = str.split(//).map(&:to_i)
  end
  
  def slices(n)
    raise ArgumentError.new('Slice is longer than input') if n > @series.length
    @series.each_cons(n).to_a
  end
end