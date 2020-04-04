# Assignment
# Mortgage / Car Loan Calculator

require 'pry'

# > Integers
#   - loan amount
#   - annual percentage rate
#   - loan duration
# < Integers
#   - monthly interest rate
#   - loan duration in months
# ! Rules
#   - monthly payment formula
#     - m = p * (j / (1 - (1 + j)**(-n)))
#         - m = monthly payment
#         - p = loan amount
#         - j = monthly interest rate
#         - n = loan duration in months
#   - monthly interest rate formula
#     - j = apr / 12
#       apr - annual percentage rate in decimal format
#   - loan duration in months
#     - n = duration * 12
# ~ Algorithm
#   - write method that prompts user
#     - takes a string, adds a '=>'
#     - prints
#   - write a method that asks a user a question
#     - takes a question_str
#     - validates question_str is an integer
#   - write a method that takes a int as a percentage and outputs in decimal format
#     - int / 100
#   - retrieve loan amount (p), apr, and loan duration
#   - write a method that does all the calculations and outputs as hash
#     - method to calculate monthly payment
#     - method to calculate monthly interest rate

def prompt(str)
  puts "=> #{str}"
end

def valid_int?(str)
  # evaluates to nil if other than int
  str.match(/^\d+\.*\d*$/)
end

def ask_user(question, details=nil)
  response = nil
  loop do
    prompt(question)
    prompt(details) if details != nil
    response = gets.chomp
    valid_int?(response) ? break : prompt("Please enter a valid integer")
  end
  response
end

def percent_to_decimal(percentage)
  percentage / 100
end

def calc_monthly_payment(p, j, n)
  m = p * (j / (1 - (1 + j)**(-n)))
end

def insert_commas(number)
  number = number.to_s.chars.reverse
  count = 0
  str = number.map do |char|
    count += 1
    count % 3 == 0 ? ',' + char : char
  end
  str.reverse.join
end

def display_loan_details(loan)
  prompt "Loan details"
  prompt "Amount: $#{insert_commas(loan[:amount])}"
  prompt "APR: #{loan[:apr]*100}%"
  prompt "Duration: #{loan[:duration]} months"
  prompt "Monthly payment: $#{loan[:monthly_payment].round(2)}"
end

prompt "Welcome to the loan calculator!"
prompt "Written by: Connor Maher"
loan_str     = ask_user "Please enter the loan amount"
apr_str      = ask_user "Please enter the Annual Percentage Rate", "(Example: 5 for 5% or 2.5 for 2.5%)"
duration_str = ask_user "Please enter the loan duraton"
loan = {}

loan[:amount]           = loan_str.to_i
loan[:apr]              = percent_to_decimal(apr_str.to_f)
loan[:monthly_interest] = (loan[:apr] / 12)
loan[:duration]         = (duration_str.to_i * 12)
loan[:monthly_payment]  = calc_monthly_payment(loan[:amount], loan[:monthly_interest], loan[:duration])

display_loan_details(loan)
