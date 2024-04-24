# input: string
# output: true or false

# rules:
# - the word is the same printed in reverse
# - all characters are match, including puncutation
# - when comparing the original and reversed strings, the
# - case of each character matches the other.

# Given a string, create a new string with the original string's
# characters printed in reverse order. Compare each character in the
# original string to the corresponding character in the new string.
# If every character is identical to the other, return true,
# Otherwise, return false.

# Given a string:
# - initialize a new variable named reverse_str
# - set reverse_str to the reverse of the local method variable str
# - if str = reverse_str, return true
# - otherwise return false

=begin
START

# Given a string str

SET reverse_str = reverse of str

IF str = reverse_str
  return true
ELSE
  return false

END
=end

def palindrome?(str)
  reverse_str = str.reverse
  reverse_str == str
end

# Further exploration:

# Array#reverse returns a new array with the values at each index assigned in
# reverse order. For this reason, the above method will work for an array.
