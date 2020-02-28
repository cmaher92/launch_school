require 'pry'
# The new "Avengers" movie has just been released!
# There are a lot of people at the cinema box office standing in a huge line.
# Each of them has a single 100, 50 or 25 dollar bill.
# An "Avengers" ticket costs 25 dollars.
#
# Vasya is currently working as a clerk.
# He wants to sell a ticket to every single person in this line.
#
# Can Vasya sell a ticket to every person and give change if he initially
# has no money and sells the tickets strictly in the order people queue?
#
# Return YES, if Vasya can sell a ticket to every person and
# give change with the bills he has at hand at that moment. Otherwise return NO.

# input
  # array of ints; each item represents a persons money
# output
  # string; yes or no
# rules
#   each person has a single 100, 50 or 25 dollar bill
#   ticket costs 25

# create a variable that represents the money in the register
  # []
# create a variable for ticket price
  # 25
# for each person
  # if equal to ticket value, next
  # calculate change_due
  # see if register contains exact change_due, if it does remove it and next
  # change_due = 75
  # register = [25, 25, 50]
  # combinations << register.combinations(2)
  # combinations << register.combinations(3)
  # combinations.uniq!
  # combinations.each |combo|
    # check to see if any possible combinations work
    # combo.reduce(&:+) == change_due
    # if it works, update register
    # if not keep iterating

# fix this method
# input
  # array; ints
# output
  # array; arrays or empty if no combinations

# take the array of ints
  # find all combinations
def find_combinations( register)
  combos = register.combination(2).to_a
  register.combination(3).to_a.each { |combo| combos << combo }
  combos.uniq
end

def valid_combination(combos, change_due)
  combos.delete(nil) if combos.include?(nil)
  combos.each do |combo|
    return combo if combo.reduce(&:+) == change_due
  end
  []
end

def tickets(people)
  price = 25
  register = []
  people.each do |money|
    if money == price
      register << price
      next
    end
    # add money to register
    register << money

    # calc change_due
    change_due = money - price

    # if register empty, return 'NO'
    return 'NO' if register.empty? && change_due > 0


    # if change due is more than the register total, return 'NO'
    if change_due > register.reduce(&:+)
      binding.pry
      return 'NO'
    end

    # if change due is one of the values in the register
    # remove the value, next
    if register.index(change_due) != nil
      register.delete_at(register.index(change_due))
      next
    end

    # find combinations
    combos = find_combinations(register)

    # any working combinations?
    combo = valid_combination(combos, change_due)
    if combo.empty?
      return 'NO'
    else
      # found working bill combo
      # remove each bill from register
      # next
      combo.each do |bill|
        register.delete_at(register.index(bill))
        next
      end
    end

  end
  return 'YES'
end



# Examples:
# puts tickets([25, 25, 50]) == 'YES'
# puts tickets([25, 100])    == 'NO'# Vasya will not have enough money to give change to 100 dollars
# puts tickets([25, 25, 50, 50, 100]) == 'NO'# => NO. Vasya will not have the right bills to give 75 dollars of change (you can't make two bills of 25 from one of 50)

# puts tickets([25, 25, 50, 100])
# puts tickets([25, 100])

# failing tests
p tickets([25, 25, 25, 50, 25, 100, 25, 25, 25, 25, 100, 50, 25, 25, 25, 25])
