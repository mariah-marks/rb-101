# input: 6 numbers
# output: validate if 6th number is matches one of the first 5 numbers

# data structure: array

# Given 6 numbers:
# - add first five numbers to empty array
# - if sixth number matches one of the numbers in array
# -- output match
# - otherwise, output no match

def prompt(string)
  puts "==> #{string}"
end

def convert_str
  gets.chomp.to_i
end

first_five_numbers = []

prompt "Enter the first number:"
first_five_numbers << convert_str

prompt "Enter the second number:"
first_five_numbers << convert_str

prompt "Enter the third number:"
first_five_numbers << convert_str

prompt "Enter the fourth number:"
first_five_numbers << convert_str

prompt "Enter the fifth number:"
first_five_numbers << convert_str

prompt "Enter the last number:"
last_number = convert_str

if first_five_numbers.include? last_number
  prompt "The number #{last_number} appears in #{first_five_numbers}."
else
  prompt "The number #{last_number} does not appear in #{first_five_numbers}."
end
