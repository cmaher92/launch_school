# loan calculator

# formula for loans
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months
m = p * (j / (1 - (1 + j)**(-n)))

def integer?(num)
    num.to_i.to_s == num
end

def float?(num)
    num.to_f.to_s == num
end

def valid_number?(num)
    integer?(num) || float?(num)
end

def prompt(message)
    puts("=> #{message}")
end

prompt('Welcome to a simple loan calculator')

# Request the loan amount
loan_amount = ''
loop do 
    prompt('Please enter the amount that you have been loaned:')
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
        break
    else
       prompt('Thats not that type of loans I am able to analyze')
       prompt('Can you please enter the amount of your loan')
    end
end

# Request the APR
apr = ''
loop do
    prompt('Can you please enter the APR of your loan?')
    prompt('Example: 4%')
    if valid_number?(apr)
        break
    else
       prompt('Please try again')
    end
end
# Request the loan duration

# Calculate APR to monthly 
# method that takes APR as an String
# converts to float
# divide by 12
# return monthly interest rate

# Calculate the loan duration in months, make sure to convert to int
# given a loan duration in years
# divide that loan duration by 12
# return loan duration in months as int

# integer? 
# float?