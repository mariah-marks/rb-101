# input: number
# output: a negative number

# Given an integer:
# - if positive, return a negative number
# - if negative, return the number

def make_negative(num)
  num > 0 ? (num * -1) : num
end

puts make_negative(5) == -5
puts make_negative(-3) == -3
puts make_negative(0) == 0
