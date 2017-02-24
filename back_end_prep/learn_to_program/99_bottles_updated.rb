# 99 Bottles using english_number

load 'english_number.rb'

def bottles number
	if number == 0
		return
	end
	bottle_count = number
	puts 'There are ' + english_number(bottle_count) + ' bottles of beer on the wall'
	puts 'Take one down, pass it around'
	puts 'There are ' + english_number(bottle_count - 1) + ' bottles of beer on the wall'
	bottles bottle_count - 1
end

bottles 9

#while bottle_count > 0
 # puts 'There are ' + bottle_count.to_s + ' bottles of beer on the wall'
  #puts bottle_count.to_s +  ' bottles of beer'
 # puts 'Take one down, pass it around'
 # puts 'Now they\'re are, ' + bottle_count.to_s + ' bottles of beer on the wall'
 # puts
 # bottle_count -= 1
#end

