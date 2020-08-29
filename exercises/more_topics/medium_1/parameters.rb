items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  items.each { |e| yield(e) }
  puts "Nice selection of food we have gathered!"
end

gather(items) { |item| puts "I gathered a #{item}!" }
