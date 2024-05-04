# The String#split method returns an array of strings, with `.` as the delimiter
# To fix this code, we can add a return before the do/while condition
# that returns false when the array returned by String#split doesn't return 4
# elements.

# The code will work as is, but the `return` keyword on line 7 can be removed
# because `true` is the last line of the method, which means it will be returned

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
  end
  true
end

dot_separated_ip_address?("4.5.5") # => false
dot_separated_ip_address?("1.2.3.4.5") # => false
dot_separated_ip_address?("10.4.5.11") # => true
