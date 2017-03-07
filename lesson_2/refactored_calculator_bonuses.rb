# Loops create a new block scope. Variables within it are within the local scope.
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
puts MESSAGES.inspect

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  if num.to_i == 0 && num != "0"
    false
  else
    true
  end
end

# def number?(num)
#   num.to_f.to_s == num || num.to_i.to_s == num 
# end

def operation_to_message(op)
word = case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end

x = "A random line of code"
word

end

prompt(MESSAGES['welcome'])
name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do

number1 = ''
number2 = ''
operator = ''

loop do
  prompt(MESSAGES[fn])
  number1 = Kernel.gets().chomp()
  if valid_number?(number1)
    break
  else
    prompt("Hmm..that doesn't look like a valid number")
  end
end

loop do
prompt(MESSAGES[sn])
number2 = Kernel.gets().chomp()

if valid_number?(number2)
break
else
  prompt(MESSAGES[not_valid_number])
end
end

operator_prompt = <<-MSG
What operation would you like to perform?
1) add
2) subtract
3) multiply
4) divide
MSG

prompt(operator_prompt)
loop do
  operator = Kernel.gets().chomp()
  if %w(1 2 3 4).include?(operator)
    break
  else
    prompt("Must choose 1,2,3 or 4")
  end
end

prompt("#{operation_to_message(operator)} the two numbers...")

result = case operator
when '1'
  number1.to_i + number2.to_i
when '2'
  number1.to_i - number2.to_i
when '3'
  number1.to_i * number2.to_i
when '4'
  number1.to_f / number2.to_f
end

prompt("The result is #{result}")
prompt("do you want to perform another calculation? (Y to continue)")
answer = Kernel.gets().chomp()
break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator. Goodbye!")