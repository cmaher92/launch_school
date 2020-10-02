# Scrabble Score
# 9/21/2020

# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10

VALUES = {
  # %w(a e i o u l n r s t)
  'a' => 1,
  'e' => 1,
  'i' => 1,
  'o' => 1,
  'u' => 1,
  'l' => 1,
  'n' => 1,
  'r' => 1,
  's' => 1,
  't' => 1,
  'd' => 2,
  'g' => 2,
  'b' => 3,
  'c' => 3,
  'm' => 3,
  'p' => 3,
  'f' => 4,
  'h' => 4,
  'v' => 4,
  'w' => 4,
  'y' => 4,
  'k' => 5,
  'j' => 8,
  'x' => 8,
  'q' => 10,
  'z' => 10
}

# input:
#   - str
# output:
#   - integer
# rules/constraints:
#   -
# test input/output
#   - empty string => 0
#   - whitespace chars => 0
#   - nil => 0
#   - case insensitive
#   - instance and class methods
# algorithm/data structure:
#   - create Scrabble class
#     - score class method
#     - score instance method
#   - scan for letter chars
#   - map each char to values
#   - reduce, summing all values

class Scrabble
  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil?
    words = @word.downcase.scan(/[a-z]/)
    return 0 if words.empty?
    words.map { |char| VALUES[char] }.reduce(:+)
  end

  def self.score(word)
    return 0 if word.nil?
    words = word.downcase.scan(/[a-z]/)
    return 0 if words.empty?
    words.map { |char| VALUES[char] }.reduce(:+)
  end
end
