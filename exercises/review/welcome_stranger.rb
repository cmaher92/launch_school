# welcome_stranger.rb

# input (array, hash)
# - array will contain two or more elements that, when combined with adjoining spaces, will produce
#   a persons' name.
# - hash will contain two keys
#   - :title
#   - :occupation
#

def greetings(names, job_info)
  puts "Hello, #{names.join(' ')}! Nice to have a #{job_info[:title]} #{job_info[:occupation]} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
