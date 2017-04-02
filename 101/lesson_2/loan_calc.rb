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

def calc_monthly_interest(apr)
    apr = apr.to_f
    apr / 12
end

def loan_duration_in_months(loan_duration)
    loan_duration = loan_duration.to_i
    loan_duration * 12
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
loan_duration = ''
loop do
    prompt('Can you please enter the duration of your loan in years')
    prompt('Example: 10')
    if valid_number?(apr)
        break
    else
       prompt('Please try again')
    end
end