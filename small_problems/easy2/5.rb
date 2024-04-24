# input: name or name with "!"
# output: uppercase or lowercase string

# Given a name
# - check if name is appended with '!'
# - if so, remove '!' and output uppercased greeting with uppercased name
# - otherwise, output greeting with capitalized name

puts "What is your name?"
user_name = gets.chomp

if user_name.end_with?('!')
  name = user_name.chop
  puts "HI THERE #{name.upcase}. WHY ARE WE SHOUTING?"
else
  puts "Hello #{user_name.capitalize}."
end
