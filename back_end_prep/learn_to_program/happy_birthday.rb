# happy birthday
# asks a person when there birthday is and figure how many birthday's they've had

puts "What year were you born in"
year = gets.chomp
puts "What month were you born in?"
month = gets.chomp
puts "What day were you born in?"
day = gets.chomp

birthday = Time.new(year, month, day)
time_today = Time.new

birthday_epoch = birthday.to_i
today_epoch = time_today.to_i

difference_secs = today_epoch - birthday_epoch
difference_in_mins = difference_secs / 60
difference_in_hrs = difference_in_mins / 60
difference_in_days = difference_in_hrs / 24
years = difference_in_days / 365
while years > 0
  puts "SPANK"
  years -= 1
end 
