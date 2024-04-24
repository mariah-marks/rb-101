# input: string
# output: middle character(s) of the string

# rules:
# - a string with an odd number of characters should return 1 character
# - Otherwise, it should return 2 characters

# Given a string:
# - check if string is empty
# -- if empty, print error message

# - if string length is even:
# -- set index to length/ 2
# -- supply value at index
# - if string length is odd:
# -- set index to length - 1 / 2
# -- supply value at index and index + 1

# Test conditions:
# center_of('I love ruby') == 'e' => true
# center_of('Launch School') == ' ' => true
# center_of('Launch') == 'un' => true
# center_of('x') == 'x'

def center_of(string)
  middle_values = ""
  index = (string.length / 2)

  if string.length.odd?
    string[index]
  else
    index = (string.length - 1) / 2
    middle_values[0] = string[index]
    middle_values << string[index + 1]
  end
end
