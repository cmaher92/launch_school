# beer_song.rb
# ruby challenges/easy 2
# 10/15/2020
require 'pry'

class BeerSong
  def verse(n)
    n1, n2 = [n, n-1] if n > 1
    n1, n2 = [1, "no more"] if n == 1
    n1, n2 = ["no more", 0] if n == 0
    first_line_of_verse(n1) + second_line_of_verse(n2)
  end

  def verses(first, last)
    n = [*last..first].reverse
    n.map { |num| verse(num) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  private

  def first_line_of_verse(n)
    str = "bottles"
    str = "bottle" if n == 1
    "#{n.to_s.capitalize} #{str} of beer on the wall, #{n} #{str} of beer.\n"
  end

  def second_line_of_verse(n, str="one", b_str="bottles")
    return "Go to the store and buy some more, 99 bottles of beer on the wall.\n" if n == 0
    # Handle for > 1
    b_str = "bottle" if n == 1
    str = "it" if n == "no more"
    "Take #{str} down and pass it around, #{n} #{b_str} of beer on the wall.\n"
  end
end
