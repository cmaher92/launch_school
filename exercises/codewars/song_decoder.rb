def song_decoder(song)
  song.gsub(/(WUB)+/, ' ').strip
end

p song_decoder("AWUBBWUBC")
p song_decoder("AWUBWUBWUBBWUBWUBWUBC")
p song_decoder("WUBAWUBBWUBCWUB") # need to remove leading and trailing whitespace
