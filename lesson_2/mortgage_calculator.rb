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

def valid_name?(name)
  !name.empty? && !name.strip.empty?
end

def valid_integer?(num)
  (num.to_i.to_s == num) && num.to_i > 0
end

def valid_float?(num)
  (num.to_f.to_s == num) && num.to_f > 0
end

def valid_apr?(num)
  (num.to_f < 100) && (valid_integer?(num) || valid_float?(num))
end

def remove_trailing_zeros(num)
  unless valid_integer?(num)
    num = num.chop until num.end_with?("0") == false
    num
  end
end

def months(duration)
  duration.to_f * MONTHS_IN_YEAR
end

def interest(apr)
  (apr.to_f / 100) / MONTHS_IN_YEAR
end

def payment(loan, interest, months)
  if interest == 0
    loan.to_f / months
  else
    loan.to_f * (interest / (1 - ((1 + interest)**(-months))))
  end
end

display "greeting"
sleep 0.5
prompt "get_name"

user_name = ""
loop do
  user_name = gets.chomp.capitalize
  if valid_name?(user_name)
    user_name.strip!
    break
  else
    display "invalid_name"
  end
end

system "clear"
puts format(MESSAGES["hi_name"], name: user_name)
sleep 0.5

loop do # main loop
  loan = ""
  loop do
    prompt "loan_amount"
    loan = gets.chomp
    break if valid_integer?(loan)
    display "invalid_number"
  end

  apr = ""
  loop do
    prompt "apr"
    apr = gets.chomp
    break if valid_apr?(apr) || valid_apr?(remove_trailing_zeros(apr))
    display "invalid_apr"
  end

  duration = ""
  loop do
    prompt "loan_duration"
    duration = gets.chomp
    break if valid_integer?(duration)
    display "invalid_duration"
  end

  monthly_payment = payment(loan, interest(apr), months(duration))
  total_interest = (monthly_payment * months(duration)) - loan.to_f

  sleep 0.5
  system "clear"
  puts format(MESSAGES["display_result"], loan: loan, apr: apr.to_f.round(4), \
                                          payment: monthly_payment.round(2), \
                                          months: months(duration).round, \
                                          total_interest: \
                                          total_interest.round(2))
  sleep 1
  puts
  prompt "go_again"
  go_again = gets.chomp.downcase
  break if !go_again.start_with?("y")
  system "clear"
end
