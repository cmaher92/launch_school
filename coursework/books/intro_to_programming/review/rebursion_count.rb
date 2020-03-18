# use recursion to count to 0

def counter(num)
    puts num
    counter(num - 1) if num > 0
end

puts "> What do you want me to count down from?"
num = gets.chomp.to_i
counter(num)