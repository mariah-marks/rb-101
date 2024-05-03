limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# Local variable `limit` is defined outside the method definition, so it isn't
# available within method defintion.

# This can be fixed by moving the initialization of the limit variable to the
# inside of the method defintion.

# Alternatively, you can add a limit parameter to the method definition, and
# pass limit as argument at the method invocation.
