# birthday helper

# read in names and birthdates from a text file
# then ask for a name, and replies with that person's next birthday
# and how old they will be

require 'yaml'
require 'pry'

def birthday_helper
  birthdays = {}
  puts 'Please enter the name and extension of the file'
  puts 'Example: test.txt'
  file = gets.chomp
  if File.exist?(file) == false
    puts 'Please enter the name of a file that exists'
    return
  end
  File.open(file, 'r') do |f|
    f.each_line do |line|
      comma = 0
      current_index = 0
      line.each_char do |char|
        if char == ','
          comma = current_index
          current_index = 0
          break
        else
          current_index += 1
        end
      end
      name = line.slice!(0..(comma-1))
      name = name.downcase
      birthdays[name] = ''
      length = line.length
      date = line.slice!(2..length).strip
      date = date.downcase
      birthdays[name] = date
    end
  end
  puts 'Please enter a name and I will find their birthday for you!'
  name_requested = gets.chomp
  name_requested = name_requested.downcase
  if birthdays.key?(name_requested)
    puts birthdays[name_requested]
  else
    puts 'I\'m sorry but that name isn\'nt on the list'
  end
  # binding.pry
end
birthday_helper
