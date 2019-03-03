require 'pry'

def prompt(message)
  puts "=>#{message}"
end

def valid_number?(num)
  # check for both floats and integer
  (num.to_i.to_s == num) || (num.to_f.to_s == num)
end

prompt("Welcome to Mortgage Calculator!")
prompt("-------------------------------")

loop do
  loan_amount = ''
  loop do
    prompt("What is the loan ammount?")
    loan_amount = gets.chomp
    break if valid_number?(loan_amount)
    prompt("Invalid input")
  end

  apr = ''
  loop do
    prompt ("What is the apr?")
    apr = gets.chomp
    break if valid_number?(apr)
    prompt("Invalid input")
  end

  duration_years = ''
  loop do
    prompt("What is the loan duration? please put it in years")
    duration_years = gets.chomp
    break if valid_number?(duration_years)
    prompt("Invalid input")
  end

  monthly_interest = apr.to_f / 12
  prompt("Your monthly interest #{monthly_interest}")

  duration_months = duration_years.to_f * 12
  prompt("Your duration in months is #{duration_months}")


  #varaible name brevity for the formula to fit in one line
  j = monthly_interest / 100
  p = loan_amount.to_f
  n = duration_months.to_f

  monthly_payment = m = p * (j / (1 - (1 + j)**(-n)))
  prompt(format("%02.2f",monthly_payment))

  prompt("would you like to do another calculation?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
