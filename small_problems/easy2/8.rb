# input: integer > 0
# output: sum or product of all numbers between 1 and integer

# Array
# Given an integer:
# - create an array of values from 1..integer
# - if computing sum, iterate over array and add each element to sum
# - if computing product, iterate over array and mulitply each element
# - display the output

def prompt(text)
  puts ">> #{text}"
end

def valid_number?(num)
  (num.to_i > 0) && (num.to_f == num.to_s.to_i)
end

prompt("Please enter an integer greater than 0:")

integer = nil
loop do
  integer = gets.chomp
  break if valid_number?(integer)
  prompt "Error, please enter a valid integer greater than 0."
end

prompt "Please enter 's' or 'p'."
operator = ""
loop do
  operator = gets.chomp.downcase

  break if (operator == 's') || (operator == 'p')
  prompt "Error, please enter 's' or 'p'."
end

factors = (1..integer.to_i).to_a

if operator == "s"
  sum = 0
  factors.each { |i| sum += i }
  prompt "The sum of integers between 1 and #{integer.to_i} is #{sum}."
elsif operator == "p"
  product = 1
  factors.each { |i| product *= i }
  prompt "The product of integers between 1 and #{integer.to_i} is #{product}."
end
