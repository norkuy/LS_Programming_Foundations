# Calculate monthly interest rate and loan duration in months
loan_amount = ''
apr = ''
loan_duration = ''

loop do
  puts "Enter Loan Amount:"
  loan_amount = Kernel.gets().chomp()

  if loan_amount.empty?() || loan_amount.to_i() < 0
    puts "Must be a value greater than 0"
  else
    loan_amount = loan_amount.to_i()
    break
  end
end

loop do
  puts "Enter Annual Percentage Rate (APR) For example 3.5 for 3.5%:"
  apr = Kernel.gets().chomp()

  if apr.empty?() || apr.to_i() < 0
    puts "Must be a value greater than 0"
  else
    apr = apr.to_f()
    break
  end
end

loop do
  puts "Enter Loan Duration in Years:"
  loan_duration = Kernel.gets().chomp()
  if loan_duration.empty?() || loan_duration.to_i() < 0
    puts "Must enter a value greater than 0"
  else
    loan_duration = loan_duration.to_i
    break
  end
end

monthly_loan_duration = loan_duration * 12
mpr = apr / 100

# monthly payment = p * (j / (1 - (1 + j)**(-n)))
# m = montly payment
# p = loan payment
# j = monthly interest rate
# n = loan duration in months

monthly_payment = loan_amount.to_i * (mpr / (1 - (1 + mpr)**(-monthly_loan_duration.to_i)))

puts "Your monthly payment is $#{format('%02.2f', monthly_payment)}"
