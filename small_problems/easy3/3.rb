# input: word or multiple words
# output: character count (spaces omitted)

# rules:
# - spaces are omitted from the character count
# - non-alphanumeric characters are counted

# Given a string:
# - remove any spaces
# - count characters
# - print a message containing the character count

puts "Please write a word or sentence:"
string = gets.chomp
puts "There are #{string.delete(' ').length} characters in \"#{string}\""
