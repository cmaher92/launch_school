# find the index of the first name that starts with be

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# I've been studying regex so I thought this was a great opportunity to
# use the #match method
# I also could have just done value == 'Betty'
p flintstones.find_index { |value| value =~ /Be\w*/}
