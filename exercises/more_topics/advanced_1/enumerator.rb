# require 'pry'

# enum = Enumerator.new do |y|
#   a = 1
#   loop do
#     y << a
#     a += 2
#   end
# end

# enum.each do |num|
#   puts num
#   break if num >= 20
# end

# 0 => 1     => 1
# 1 => 1     => 1
# 2 => 2 * 1 => 2
# 3 => 3 * 2 * 1 => 6
# 4 => 4 * 3 * 2 * 1 => 24
# ...

# loop
#  if n is 0 or 1
#  - yield 1
#  else
#  - yield 1..n.to_a.reduce(&:*)
#  end
#  n += 1

factorial = Enumerator.new do |y|
  n = 0
  loop do
    y << 1 if n == 1 || n == 0
    y << (1..n).reduce(&:*) unless n == 1 || n == 0
    n += 1
  end
end

3.times { |num| puts "#{num}! == #{factorial.next}!" }
3.times { |num| puts "#{num}! == #{factorial.next}!" }
factorial.rewind
3.times { |num| puts "#{num}! == #{factorial.next}!" }
