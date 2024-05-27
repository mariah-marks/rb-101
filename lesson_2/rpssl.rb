require "yaml"

MESSAGES = YAML.load_file("rpssl_messages.yml")

VALID_CHOICES = %w(rock paper scissors spock lizard)

VALID_ABBREVIATIONS = { "r" => "rock",
                        "p" => "paper",
                        "s" => "scissors",
                        "sp" => "spock",
                        "l" => "lizard" }

WINNING_COMBINATIONS = { "rock" => ["lizard", "scissors"],
                         "paper" => ["spock", "rock"],
                         "scissors" => ["lizard", "paper"],
                         "spock" => ["scissors", "rock"],
                         "lizard" => ["paper", "spock"] }
def get_input
  gets.chomp.downcase
end

def get_choice
  choice = ""

  loop do
    display_message "choose_one", prompt: true
    choice = get_input
    break if valid_choice?(VALID_CHOICES, choice)

    if valid_choice?(VALID_ABBREVIATIONS, choice)
      choice = VALID_ABBREVIATIONS[choice]
      break
    else
      display_message "invalid_choice"
    end
  end
  choice
end

def get_computer_choice
  VALID_CHOICES.sample
end

def valid_choice?(valid_choices, choice)
  valid_choices.include?(choice)
end

def display_message(key, prompt: false)
  if prompt
    puts "=> #{MESSAGES[key]}"
  else
    puts MESSAGES[key]
  end
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

def blank_line
  puts
end

def winner(scores)
  if scores[:user] > scores[:computer]
    "won"
  elsif scores[:computer] > scores[:user]
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

def keep_score(winner, score)
  if winner == "user"
    score[:user] += 1
  elsif winner == "computer"
    score[:computer] += 1
  end
end

def three_wins?(score)
  score[:user] == 3 || score[:computer] == 3
end

def play_again(input)
  input.downcase.start_with?('y')
end

clear
display_message "greeting"
wait_seconds(:half)
display_message "instructions"
blank_line
wait_seconds(:one)
get_input
clear

loop do # main loop
  score = { user: 0, computer: 0 }

  loop do
    choice = get_choice
    computer_choice = get_computer_choice

    match_winner = round_winner(choice, computer_choice)
    round_choices = { choice: choice, computer_choice: computer_choice }
    blank_line
    display_with_value("results", round_choices)
    blank_line
    display_message(match_winner)
    keep_score(match_winner, score)
    display_with_value("match_score", score)
    blank_line

    break if three_wins?(score)
  end

  wait_seconds(:half)
  blank_line
  display_with_value("final_score", score)
  blank_line
  display_message winner(score)
  wait_seconds(:one)
  blank_line
  display_message "play_again", prompt: true

  user_input = get_input
  break unless play_again(user_input)
  clear
end
