# input: integer
# output: true or false

# Given an integer
# - determine whether the string representation of the integer
# - is a palindrome.

# Test conditions:
# palindromic_number?(34543) == true
# palindromic_number?(123210) == false
# palindromic_number?(5) == true

=begin
START

Given an integer
  SET variable num to string representation of integer
  SET variable reverse_num to reverse of num

  IF num = reverse_num
    return true
  ELSE
    return false

END
=end

def palindromic_number?(num)
  num = num.to_s
  reverse_num = num.reverse
  num == reverse_num
end
