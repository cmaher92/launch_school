#!/Users/cmaher/.rbenv/shims/ruby -w

class BeerSong
  def verse(num)
    verses = [
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n",
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n",
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n",
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    ] 
    case
    when num > 2  then verses[0]
    when num == 2 then verses[1]
    when num == 1 then verses[2]
    else
      verses[3]
    end
  end

  def verses(first, last)
    (last..first).map { |num| self.verse(num) }.reverse.join("\n")
  end

  def lyrics
    self.verses(99, 0)
  end
end
