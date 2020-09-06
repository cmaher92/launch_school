class Sieve
  attr_reader :primes
  
  def initialize(n)
    @primes = sieve(n)
  end
  
  def sieve(n)
    composite = {}
    (2..n).select do |p|
      next false if composite[p]
      (p..n).step(p) { |c| composite[c] = true }
    end
  end
end