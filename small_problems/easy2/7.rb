# print all even numbers between 1-99

arr = (1..99).to_a
even_numbers = arr.select { |num| num % 2 == 0 }
puts even_numbers

# Solution 2

1.upto(99) { |n| puts n if n.even? }
