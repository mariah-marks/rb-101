# Given an integer:
# - Convert the integer to an absolute value.
# - If division by two returns a remainder equal to one,
# - return true.
# - Otherwise, return false.

def is_odd?(number)
  number.abs.remainder(2) == 1
end
