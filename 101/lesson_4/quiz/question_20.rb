# Your team is asked to refactor some legacy code used by the marketing team. 
# One of the requirements of the project is to change the implementation from 
# using basic looping structures to using iterative methods instead.

require 'pry'
# Sample data:
mailing_campaign_leads = [
  {name: 'Emma Lopez', email: 'emma.lopez@some_mail.com', days_since_login: 423, mailing_list: true},
  {name: 'mike richards', email: 'michael.richards@some_mail.com', days_since_login: 23, mailing_list: false},
  {name: 'JANE WILLIAMS', email: 'jane_w95@my_mail.com', days_since_login: 16, mailing_list: true},
  {name: 'Ash Patel', email: 'ash_patel@my_mail.com', days_since_login: 22, mailing_list: true}
]



# # option 1
# # only capitalizes the first name
# mailing_campaign_leads.map do |lead|
#   lead[:name].capitalize!
# end

# # this works, but the capitalization makes this option not viable
# mailing_campaign_leads.select! do |lead|
#   lead[:days_since_login] < 60 && lead[:mailing_list]
# end

# # option 2
# mailing_campaign_leads.each do |lead|
#   # this works because we are working in a loop, not a method
#   names = lead[:name].split # splits into arr of names
#   names.map! { |name| name.capitalize } # capitalizes each name
#   lead[:name] = names.join(' ') # saves back to hash
# end

# usable_leads = mailing_campaign_leads.keep_if do |lead|
#   # It's not supposed to be less than or equal to 60, just less than
#   # so this makes option 2 not viable
#   lead[:days_since_login] <= 60 && lead[:mailing_list]
# end

# # option 3
# # works but using reject makes it slightly harder to read
# mailing_campaign_leads.each do |lead|
#   # splits the names into a names arr
#   names = lead[:name].split
#   # saves the capitalized names as a sring back to the :name 
#   lead[:name] = names.map { |name| name.capitalize }.join(' ')
# end

usable_leads = mailing_campaign_leads.reject do |lead|
  #reject returns all the elements for which this block returns false
  last_login = lead[:days_since_login]
  subscribed_to_list = lead[:mailing_list]
  # 300, true
  binding.pry
  # this statement will return false anytime that last_login is between 1-59 
  # or if subscribed to list is true. 
  # so if any customer has logins below 59 they'll be added to the list 
  # regardless of the status of their subscribed_to_list 
  # this is ONLY not adding to usable_leads when last_login is 60 or above
  # and they aren't subscribed, we need it to not add if either of the two
  # cases are not met. 
  last_login > 59 && !subscribed_to_list
  # if this returns false, the lead will be placed into the usable_leads
  # array
  
end
p usable_leads

# # option 4
# mailing_campaign_leads.each do |lead|
#   names = lead[:name].split
#   names.map! { |name| name.capitalize }
#   lead[:name] = names.join(' ')
# end

# usable_leads = mailing_campaign_leads.select do |lead|
#   lead[:days_since_login] < 60 && lead[:mailing_list]
# end

=begin
# Legacy code
# capitalizes name
# selects customers that have logged in within 60 days and are opted into the
# mailing list
# input, array of hashses
# output, array of hashes
counter = 0

# capitalizes name in hash for :name key
loop do
  # grabs the names and saves each name to an array containing the user's full name
  # example ['first', 'last']
  break if counter == mailing_campaign_leads.size # breaks the loop when counter == 4
  full_name = mailing_campaign_leads[counter][:name] # retrieves the full_name from each contact, 'mike rechards'
  names = full_name.split # names = ['mike', 'richards']

  # this loop capitalizes the names retrieved above
  # ['First', 'Last']
  names_counter = 0
  loop do
    break if names_counter == names.size # breaks once loop == 2
    name = names[names_counter]          # grabs the element from the names arr 'mike'
    names[names_counter] = name.capitalize # saves the grabbed name back capitalized 'Mike'

    names_counter += 1 # increments
  end

  # 'First Last'
  capitalized_full_name = names.join(' ')
  # Adjusts the hash to replace their name with their capitalized name
  mailing_campaign_leads[counter][:name] = capitalized_full_name

  counter += 1
end

#
usable_leads = []
counter = 0

# creates array of hashes for each customer that is deemed a 'usable lead'
loop do
  # break once counter == 4
  break if counter == mailing_campaign_leads.size
  last_login = mailing_campaign_leads[counter][:days_since_login] # retrieves :days_since_login and saves to variable
  subscribed_to_list = mailing_campaign_leads[counter][:mailing_list] # retrieves :mailing_list boolean and saves to variable

  # places the customer data into a usable_leads array for users that
  # have logged in within the last 60 days and are opted into the
  # subscription
  if last_login < 60 && subscribed_to_list
    usable_leads << mailing_campaign_leads[counter]
  end

  counter += 1
end
=end