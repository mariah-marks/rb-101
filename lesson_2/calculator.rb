require 'yaml'
require 'bigdecimal'
require 'bigdecimal/util'

MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(key)
  puts "=> #{MESSAGES[key]}"
  MESSAGES[key]
end

def integer?(num)
  num.to_i.to_s == num
end

def prepend_zero(num)
  if /^\.\d/.match(num)
    "0#{num}"
  elsif /^\-\.\d/.match(num)
    num.sub("-", "-0")
  else
    num
  end
end

def remove_trailing_zeros(num)
  num = num.chop until num.end_with?("0") == false
  num
end

def float?(num)
  edited_num = prepend_zero(num)
  num = remove_trailing_zeros(edited_num)
  num.to_d.to_f.to_s == num
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  options = { "1" => "Adding",
              "2" => "Subtracting",
              "3" => "Multiplying",
              "4" => "Dividing" }
  options[op]
end

prompt('welcome')

name = ''
loop do
  name = gets.chomp

  break unless name.empty?()

  prompt('valid_name')
end

puts "=> #{format(MESSAGES['greeting'], user_name: name)}"

loop do # main loop
  answer1 = ''
  loop do
    prompt('first_number')
    answer1 = gets.chomp

    break if valid_number?(answer1)

    if answer1.to_d > 0.1e10
      prompt('round_float')
    else
      prompt('valid_number')
    end
  end

  answer2 = ''
  loop do
    prompt('second_number')
    answer2 = gets.chomp

    break if valid_number?(answer2)

    if answer2.to_d > 0.1e10
      prompt('round_float')
    else
      prompt('valid_number')
    end
  end

  prompt('operation_choice')

  operator = ''
  loop do
    operator = gets.chomp

    break if %w(1 2 3 4).include?(operator)

    prompt('valid_operation')
  end

  operator_choice = operation_to_message(operator)

  puts "=> #{format(MESSAGES['operation_message'], operation: operator_choice)}"

  result = case operator
           when '1'
             answer1.to_f + answer2.to_f
           when '2'
             answer1.to_f - answer2.to_f
           when '3'
             answer1.to_f * answer2.to_f
           when '4'
             answer1.to_f / answer2.to_f
           end

  puts "=> #{format(MESSAGES['display_result'], answer: result)}"
  prompt('go_again')

  go_again = gets.chomp.downcase

  break unless go_again == 'y'
end

prompt('goodbye')
