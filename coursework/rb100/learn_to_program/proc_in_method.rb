# Define a method that takes a proc
def take_proc(proc)
    (1..3).each { |num| proc.call(num) }
end

proc = Proc.new { |num| puts "#{num} was printed by proc" }
take_proc(proc)