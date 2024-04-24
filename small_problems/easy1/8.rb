# input: positive integer
# output: return digits in reverse order

# rules: don't account for octal numbers

# Given a positive integer:
# - convert integer to string
# - reverse string
# - convert string to integer

# test conditions:
# reversed_number(12345) == 54321
# reversed_number(12000) == 21

def reversed_number(number)
  number.to_s.reverse.to_i
end
