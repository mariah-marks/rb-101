def input_prompt(word)
  puts "Enter a #{word}:"
end

input_prompt("noun")
noun = gets.chomp
input_prompt("verb")
verb = gets.chomp
input_prompt("adjective")
adjective = gets.chomp
input_prompt("adverb")
adverb = gets.chomp

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}?"
