# input: bill amount, tip percentage
# output: bill total including tip

# Given a bill amount and a tip percentage,
# - calculate the tip
# - calculate the total bill
# - display the results

# - input: string
# - output: integer

puts "What is the bill?"
bill = gets.chomp

puts "What is the tip percentage?"
tip_percentage = gets.chomp

tip_amount = bill.to_f * (tip_percentage.to_f / 100)
bill_total = bill.to_f + tip_amount

puts "The tip is $#{format('%.1f', tip_amount)}"
puts "The total is $#{format('%.1f', bill_total)}"
