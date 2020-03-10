# find the odd int
# https://www.codewars.com/kata/54da5a58ea159efa38000836

# input
#   array; ints
# output
#   int; the int that appears within the given array an odd num of times

def find_it(seq)
  seq.uniq.each { |num| return num if seq.count(num).odd? }
end
