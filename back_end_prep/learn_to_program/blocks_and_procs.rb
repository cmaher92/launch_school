# Examples from the blocks and procs chapter

# A proc is the ability to take a block of code
# wrap it in an object
# store it in a variable OR pass it to a method
# and run the code whenever you feel like it

# similar to a method except it's not bound to an object

toast = Proc.new do
  puts 'Cheers!'
end

toast.call
# Cheers!


# Procs can take parameters as well, just like methods
do_you_like = Proc.new do |good_stuff|
  puts 'I *really* like #{good_stuff}'
end

do_you_like.call 'chocolate'
# I *really* like chocolate!

# Why use Procs?
# Can't pass methods into methods
# Methods also can't return methods

# Method that takes a proc
def do_self_importantly some_proc
  puts 'Everyone just HOLD ON! I\'m doing something...'
  some_proc.call
  puts 'OK everyone, I\'m done. As you were'
end

say_hello = Proc.new do
  puts 'hello'
end

say_goodbye = Proc.new do
  puts 'Goodbye'
end

do_self_importantly say_hello
# Everyone just HOLD ON! I'm doing something...
# hello
# OK everyone, I'm done. As you were

do_self_importantly say_goodbye
# Everyone just HOLD ON! I'm doing something...
# hello
# OK everyone, I'm done. As you were


# creating procs with methods
def compose proc1, proc2
  Proc.new do |x|
    proc2.call(proc1.call(x))
  end
end

square_it = Proc.new do |x|
  x * x
end

double_it = Proc.new do |x|
  x + x
end

# Creates the proc using the method
double_then_square = compose double_it, square_it

# calls the newly created proc
puts double_then_square.call(5)
# 100

class Array
  def each_even(&was_a_block__now_a_proc)
    # this is how the method knows to define the proc
    is_even = true
      self.each do |object|
        if is_even
          was_a_block__now_a_proc
        end
        is_even = !is_even
      end
    end
  end

  fruits = ['apple', 'bad apple', 'cherry', 'durian']
  fruits.each_even do |fruit|
    puts 'Yum! I just love #{fruit} pies, don\'t you?'
  end

  [1, 2, 3, 4, 5].each_even do |odd_ball|
    puts "#{odd_ball} is NOT an even number!"
  end
end

# Another example of creating a method that takes a block
def profile block_description, &block
  start_time = Time.new
  block.call
  duration = Time.new - start_time
  puts "#{block_description}: #{duration} seconds"
end

profile '2000 dublings' do
  number = 1
  2500.times do
    number = number + number
  end
  puts "#{number.to_s.length} digits"
  # that's the number of digits in the number
end

profile 'count to a million' do
  number = 0
  1000000.times do
    number = number + 1
  end
end
