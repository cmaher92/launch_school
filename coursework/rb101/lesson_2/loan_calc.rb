# loan calculator

require 'pry'

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

def calc_monthly_interest(annual_interest)
  annual_interest / 12
end

def loan_duration_in_months(loan_duration)
  loan_duration = loan_duration.to_i
  loan_duration * 12
end

def calculate_monthly_payment(loan_amount, monthly_interest_rate,
                              loan_duration_months)
  monthly_payment = loan_amount.to_f *
                    (monthly_interest_rate /
                    (1 -
                    (1 + monthly_interest_rate)**-loan_duration_months.to_i))
  monthly_payment
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
  apr = gets.chomp
  if valid_number?(apr)
    break
  else
    prompt('Please enter a valid APR')
    prompt('Example: 4.55')
  end
end

# Request the loan duration
loan_duration = ''
loop do
  prompt('Can you please enter the duration of your loan in years')
  prompt('Example: 10')
  loan_duration = gets.chomp
  if valid_number?(apr)
    break
  else
    prompt('Please try again')
  end
end

annual_interest_rate = apr.to_f / 100
monthly_interest_rate = calc_monthly_interest(annual_interest_rate)
loan_duration_months = loan_duration_in_months(loan_duration)
monthly_payment = calculate_monthly_payment(loan_amount, monthly_interest_rate,
                                            loan_duration_months)
prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")
