# Assignment
# Mortgage / Car Loan Calculator

require 'pry'

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

def build_loan(loan_str, apr_str, duration_str)
  loan = {}
  loan[:amount]           = loan_str.to_i
  loan[:apr]              = percent_to_decimal(apr_str.to_f)
  loan[:monthly_interest] = (loan[:apr] / 12)
  loan[:duration]         = (duration_str.to_i * 12)
  loan[:monthly_payment]  = calc_monthly_payment(loan[:amount], loan[:monthly_interest], loan[:duration])
  loan
end

def get_loan_info
  loan_str     = ask_user "Please enter the loan amount"
  apr_str      = ask_user "Please enter the Annual Percentage Rate", "(Example: 5 for 5% or 2.5 for 2.5%)"
  duration_str = ask_user "Please enter the loan duraton"
  build_loan(loan_str, apr_str, duration_str)
end

prompt "Welcome to the loan calculator!"
prompt "Written by: Connor Maher"
display_loan_details(get_loan_info)
