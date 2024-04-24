# input: two arguments that evaluate as truthy
# output: boolean true or false

# rules:
# - returns true if one argument is truthy, otherwise returns false.

# If first operand evaluates as true and second evaluates as false
# - return true
# If first operand evaluates as false and second evaluates as true
# - return true
# Otherwise, return false

def xor?(first_operand, second_operand)
  return true if first_operand && !second_operand
  return true if !first_operand && second_operand
  false
end
