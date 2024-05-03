# The Integer#+ method returns an Integer object with the value 42.
# The String#+ method expects another string, and raises an exception when it's
# passed an integer instead.

# This can be fixed by calling Integer#to_s on the argument (40 + 2).
puts "the value of 40 + 2 is " + (40 + 2).to_s

# Alternatively, the result of 40 + 2 can be interpolated into the string.
puts "the value of 40 + 2 is #{40 + 2}"
