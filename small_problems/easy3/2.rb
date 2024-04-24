# input: two positive integers
# output:
# - display results of:
# -- addition, subtraction, multiplication, division, remainder and power of the
# -- two integers.

# rules:
# - only dealing with integers
# - validation not necessary

def prompt(message)
  puts "==> #{message}"
end

prompt "Enter the first number:"
first_op = gets.chomp.to_i

prompt "Enter the second number:"
second_op = gets.chomp.to_i

prompt "#{first_op} + #{second_op} = #{first_op + second_op}"
prompt "#{first_op} - #{second_op} = #{first_op - second_op}"
prompt "#{first_op} * #{second_op} = #{first_op * second_op}"
prompt "#{first_op} / #{second_op} = #{first_op / second_op}"
prompt "#{first_op} % #{second_op} = #{first_op % second_op}"
prompt "#{first_op} ** #{second_op} = #{first_op**second_op}"
