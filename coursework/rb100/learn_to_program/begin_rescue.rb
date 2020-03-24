# example of exception handling

# names = ['connor', 'skylar', 'joe', nil, 'frank']

# names.each do |name|
#     begin
#         puts "#{name}'s name has #{name.length} letters"
#     rescue
#         puts "Something went wrong!"
#     end
# end

# # in line version
# zero = 0
# puts "before each call"
# zero.each { |element| puts element } rescue puts "Can't do that"
# puts "after each call"

# rescue pre-existing errors
def divide(number, divisor)
    begin
        answer = number / divisor
    rescue ZeroDivisionError => e
        puts e.message    
    end
end
