require "yaml"

MESSAGES = YAML.load_file("mortgage_calculator_messages.yml")
MONTHS_IN_YEAR = 12

def prompt(key)
  puts ">> #{MESSAGES[key]}"
end

def display(key)
  puts MESSAGES[key]
end

def display_with_value(key, pair)
  puts format(MESSAGES[key], pair)
end

def clear
  system "clear"
end

def wait_seconds(amount)
  seconds = { half: 0.5,
              one: 1 }
  sleep seconds[amount]
end

def get_name
  user_name = ""
  loop do
    user_name = gets.chomp
    if valid_name?(user_name)
      break user_name.strip.capitalize
    else
      display "invalid_name"
    end
  end
end

def get_loan
  loan = ""
  loop do
    prompt "loan_amount"
    loan = gets.chomp
    break loan if valid_integer?(loan)
    display "invalid_number"
  end
end

def get_apr
  apr = ""
  loop do
    prompt "apr"
    apr = gets.chomp
    break apr if valid_apr?(apr) || valid_apr?(remove_trailing_zeros(apr))
    display "invalid_apr"
  end
end

def get_duration
  duration = ""
  loop do
    prompt "loan_duration"
    duration = gets.chomp
    break duration if valid_integer?(duration)
    display "invalid_duration"
  end
end

def get_go_again
  gets.chomp.downcase
end

def exit_program?(input)
  !input.start_with?("y")
end

def blank_line
  puts
end

def valid_name?(name)
  !name.empty? && !name.strip.empty?
end

def valid_integer?(num)
  (num.to_i.to_s == num) && num.to_i > 0
end

def valid_apr?(num)
  (0..100).include?(num.to_f) && \
    ((num.to_i.to_s == num) || (num.to_f.to_s == num))
end

def remove_trailing_zeros(num)
  unless valid_integer?(num)
    num.chop! until num.end_with?("0") == false
    num
  end
end

def months(duration)
  duration.to_i * MONTHS_IN_YEAR
end

def interest(apr)
  (apr / 100) / MONTHS_IN_YEAR
end

def payment(loan, interest, months)
  if interest == 0
    loan.to_f / months
  else
    loan.to_f * (interest / (1 - ((1 + interest)**(-months))))
  end
end

def total_interest(payment, months, loan)
  (payment * months) - loan.to_f
end

def round_apr(apr)
  apr.to_f.round(5)
end

def format_value(value)
  return value.floor.to_s if value.to_s.end_with?("0")
  value.to_s
end

def format_usd(amount)
  format('%.2f', amount)
end

def pair_with_key(value)
  results = {}
  fields = [:loan, :apr, :months, :payment, :interest]

  fields.each_with_index do |field, idx|
    results[field] = value[idx].to_s
  end
  results
end

clear
display "greeting"
wait_seconds(:half)
prompt "get_name"

user_name = get_name

clear
display_with_value("hi_name", name: user_name)
wait_seconds(:half)

loop do # main loop
  loan = get_loan
  apr = get_apr
  duration = get_duration
  monthly_payment = payment(loan, interest(round_apr(apr)), months(duration))
  interest = total_interest(monthly_payment, months(duration), loan)

  final_values = [loan, format_value(round_apr(apr)), \
                  format_value(months(duration)), format_usd(monthly_payment), \
                  format_usd(interest)]
  results = pair_with_key(final_values)

  wait_seconds(:half)
  clear
  display_with_value("display_result", results)
  wait_seconds(:one)
  blank_line
  prompt "go_again"
  go_again = get_go_again
  break if exit_program?(go_again)
  clear
end
