require "yaml"

MESSAGES = YAML.load_file("rpssl_messages.yml")

VALID_CHOICES = %w(rock paper scissors spock lizard)

WINNING_COMBINATIONS = { "rock" => ["lizard", "scissors"],
                         "paper" => ["spock", "rock"],
                         "scissors" => ["lizard", "paper"],
                         "spock" => ["scissors", "rock"],
                         "lizard" => ["paper", "spock"] }

def display_message(key, prompt: false)
  if prompt
    puts "=> #{MESSAGES[key]}"
  else
    puts MESSAGES[key]
  end
end

def display_winner(user, computer)
  if user > computer
    "won"
  elsif computer > user
    "computer_won"
  else
    "tie"
  end
end

def round_winner(first, second)
  if WINNING_COMBINATIONS[first].include?(second)
    "user"
  elsif WINNING_COMBINATIONS[second].include?(first)
    "computer"
  else
    "tie"
  end
end

def play_again(input)
  input.downcase.start_with?('y')
end

system "clear"
display_message "greeting"
sleep 0.5
display_message "hint"

loop do # main loop
  choice = ""
  computer_choice = ""
  round_winner = ""
  user_score = 0
  computer_score = 0
  user_choices = []
  computer_choices = []
  valid_abbreviations = { "r" => "rock",
                          "p" => "paper",
                          "s" => "scissors",
                          "sp" => "spock",
                          "l" => "lizard" }

  loop do
    loop do
      display_message "choose_one", prompt: true
      choice = gets.chomp
      break if VALID_CHOICES.include? choice

      if valid_abbreviations.include? choice
        choice = valid_abbreviations[choice]
        user_choices << choice
        break
      else
        display_message "invalid_choice"
      end
    end

    computer_choice = VALID_CHOICES.sample
    computer_choices << computer_choice
    round_winner = round_winner(choice, computer_choice)

    user_score += 1 if round_winner == "user"
    computer_score += 1 if round_winner == "computer"
    break if user_score == 3 || computer_score == 3
  end

  user_choices = user_choices.join ", "
  computer_choices = computer_choices.join ", "

  system "clear"
  sleep 0.5
  puts format(MESSAGES["results"], choice: user_choices, computer_choice: \
    computer_choices)
  sleep 0.5
  puts format(MESSAGES["display_score"], user: user_score, computer: \
    computer_score)
  display_message display_winner(user_score, computer_score)
  sleep 1
  puts
  display_message "play_again", prompt: true

  user_input = gets.chomp
  break unless play_again(user_input)
  system "clear"
end
