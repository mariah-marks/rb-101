def factors(number)
  divisor = number
  factors = []

  while divisor > 0
    factors << (number / divisor) if number % divisor == 0
    divisor -= 1
  end
  factors
end

# Bonus 1
# The purpose of `number % divisor == 0` is to check that the result
# of the `number / divisor` expression is a true factor of number, given the
# remainder is equal to 0.

# Bonus 2
# The second to last line ensures that the array referenced by factors is
# returned by the method call, using implicit return.
