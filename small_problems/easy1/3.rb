# input: positive integer
# output: string of 1s and 0s equal to input

# rules:
# - 0 should return nothing
# - Negative integers not allowed

# Given an integer:
# - Append 1 to empty string
# - Append 0 to empty string
# - Repeat until string length equals integer

# Test conditions:

# puts stringy(4) => 1010
# puts stringy(6) => 101010
# puts stringy(3) => 101
# puts stringy(0) =>

# Pseudocode

=begin

START

SET string

IF integer < 1
  break

Append "1" to string
IF integer equals string length
  break

Append "0" to string
IF integer equals string length
  break

PRINT string

END

=end

def stringy(number)
  string = ''

  loop do
    break if number < 1
    string << '1'
    break if number == string.length
    string << '0'
    break if number == string.length
  end

  string
end

puts stringy(4)
puts stringy(6)
puts stringy(3)
puts stringy(0)
