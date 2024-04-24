# input: string
# output: return true or false

# rules:
# - non-alphanumeric characters are ignored
# - the case of each character is ignored

# Given a string:
# - remove non-alphanumeric characters
# - convert all letters to lowercase
# - create a copy of the string with values reversed
# - compare the copy to the original
# - if all characters match, return true
# - otherwise return false

# Using String#gsub and regrex

def palindrome?(str)
  str == str.reverse
end

def real_palindrome(str)
  new_str = str.downcase.gsub(/[^a-z]/, '')
  palindrome?(new_str)
end

# Using String#delete

def real_palindrome?(str)
  new_str = str.downcase.delete('^a-z0-9')
  palindrome?(new_str)
end
