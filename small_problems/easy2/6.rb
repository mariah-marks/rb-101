# print each odd number on it's own line, between 0-99

(100).times { |num| puts num if num.odd? }

# Using Integer#upto

odd_nums = []
0.upto(99) { |num| odd_nums << num if num.odd? }
puts odd_nums
