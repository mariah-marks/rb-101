require "yaml"
system "clear"

MESSAGES = YAML.load_file("mortgage_calculator_messages.yml")
MONTHS_IN_YEAR = 12

def prompt(key)
  puts ">> #{MESSAGES[key]}"
end

def display(key)
  puts MESSAGES[key]
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
  duration.to_f * MONTHS_IN_YEAR
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

def round_apr(apr)
  apr.to_f.round(5)
end

def format_apr(apr)
  return apr.floor if apr.to_s.end_with?("0")
  apr
end

def format_usd(amount)
  format('%.2f', amount)
end

display "greeting"
wait_seconds(:half)
prompt "get_name"

user_name = get_name

system "clear"
puts format(MESSAGES["hi_name"], name: user_name)
wait_seconds(:half)

loop do # main loop
  loan = get_loan
  apr = get_apr
  duration = get_duration

  monthly_payment = payment(loan, interest(round_apr(apr)), months(duration))
  total_interest = (monthly_payment * months(duration)) - loan.to_f
  apr = format_apr(round_apr(apr))

  wait_seconds(:half)
  system "clear"
  puts format(MESSAGES["display_result"], loan: loan, apr: apr, \
                                          payment:
                                          format_usd(monthly_payment), \
                                          months: months(duration).round, \
                                          total_interest: \
                                          format_usd(total_interest))
  wait_seconds(:one)
  puts
  prompt "go_again"
  go_again = gets.chomp.downcase
  break if !go_again.start_with?("y")
  system "clear"
end
