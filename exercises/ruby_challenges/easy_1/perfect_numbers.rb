class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1
    # find factors
    # sum factors
    # case statement
    sum = (1...num).select { |n| num % n == 0 }.sum
    case
    when sum == num then 'perfect'
    when sum < num then 'deficient'
    else
      'abundant'
    end
  end
end