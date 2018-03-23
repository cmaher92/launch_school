=begin
Build Tower
Build Tower by the following given argument:
number of floors (integer and always greater than 0).

Tower block is represented as *

Ruby: returns an Array;

for example, a tower of 3 floors looks like below

[
  '  *  ',
  ' *** ',
  '*****'
]
and a tower of 6 floors looks like below

[
  '     *     ',
  '    ***    ',
  '   *****   ',
  '  *******  ',
  ' ********* ',
  '***********'
]

input
  n - number of floors (always more than 0)
output
  printed tower

given a n representing the number of floors
set a local variable 'star_count' to 1
create a new array passing in a block
  for each new item, it should be the star_count * the star symbol
  increment star_count by 2
  return the result of the star_count * the star symbol
=end

def towerBuilder(n)
  star_count = 1
  tower = Array.new(n) do
    stars = '*' * star_count
    star_count += 2
    stars
  end
  center_size = tower[-1].size
  tower.map { |floor| floor.center(center_size)}
end

p towerBuilder(3)
p towerBuilder(5)
