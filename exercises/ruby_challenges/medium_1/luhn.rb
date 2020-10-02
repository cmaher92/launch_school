class Luhn
  attr_reader :addends, :checksum, :number

  def initialize(n)
    @number = n
    @addends = calc_addends
    @checksum = @addends.sum
  end

  def valid?
    @checksum % 10 == 0
  end

  def self.create(n)
    n *= 10
    loop do
      luhn = Luhn.new(n)
      return luhn.number if luhn.valid?
      n += 1
    end
  end

  private

  def calc_addends
    @number.digits.map.with_index do |n, i|
      next n if i.even?
      n *= 2
      next n if n < 10
      n - 9
    end.reverse
  end
end

# p Luhn.new(12_121).addends
# p Luhn.new(8631).addends
