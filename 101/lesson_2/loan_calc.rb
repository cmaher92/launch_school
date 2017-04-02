# loan calculator

# formula for loans
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months
m = p * (j / (1 - (1 + j)**(-n)))

# High level
# Request the loan amount 
# validate input
# SET as loan_amount

# Request the APR 
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