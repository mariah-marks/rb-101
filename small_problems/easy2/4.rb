# input: age, retirement age
# output: current year, retirement year, working years left

# Find the difference between retirement age and age
# Add difference to current year
# Output results as a string

puts "What is your age?"
age = gets.chomp

puts "At what age do you want to retire?"
retirement_age = gets.chomp

years_till_retirement = (retirement_age.to_i - age.to_i)
current_year = Time.now.year
retirement_year = current_year + years_till_retirement

puts "It's #{current_year}. You will retire in #{retirement_year}. \
You have #{years_till_retirement} years of work left!"
