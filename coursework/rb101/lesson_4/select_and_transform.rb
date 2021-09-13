# select_and_transform.rb

# an example from lesson 4/selection and transformation

def double_odd_numbers(nums)
    doubled = []
    counter = 0

    loop do
        break if counter == nums.size

        current_num = nums[counter]
        current_num *= 2 if current_num.odd? # transforms and selects
        doubled << current_num

        counter += 1
    end

    doubled
end

# What is the selection criterion?
# What is the transformation criterion?
# Does this mutate 'nums' or return a new array?