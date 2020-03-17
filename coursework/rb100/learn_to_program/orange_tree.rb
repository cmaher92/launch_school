# orange tree

require 'pry'

class Orange_tree
  def initialize
    @orange_count = 0
    @height = 0
    @age = 0
  end

  def age
    puts "Age: #{@age}"
  end
  def height
    puts "Height: #{@height}"
  end
  def one_year_pass
    @orange_count = 0
    @age += 1
    @height += 1
    if @age >= 55
      return 'The tree has died'
      exit
    end
    if @age >= 3
      @orange_count += 10
    end
  end
  def count_the_oranges
    "Count: #{@orange_count}"
  end
  def pick_an_orange
    if @orange_count >= 1
      @orange_count -= 1
      puts "*Picks orange off tree*"
      puts "That orange was delicious"
    else
      puts "There are no more oranges to pick this year"
    end
  end
end

orange_tree = Orange_tree.new
orange_tree.one_year_pass
orange_tree.one_year_pass
orange_tree.one_year_pass
orange_tree.one_year_pass
orange_tree.one_year_pass
orange_tree.one_year_pass
binding.pry
