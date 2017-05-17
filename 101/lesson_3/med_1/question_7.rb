# question_7

answer = 42

def mess_with_it(some_number)
    some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
# => 34
# some_number is it's own variable within the scope of the mess_with_it() 
# function 

# new_answer has a value of 50, but the answer variable itself is never
# modified