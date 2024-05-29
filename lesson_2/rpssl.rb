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

def display_message_with_values(key, values)
  puts format(MESSAGES[key], values)
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

def get_match_winner(first, second)
  if WINNING_COMBINATIONS[first].include?(second)
    "user"
  elsif WINNING_COMBINATIONS[second].include?(first)
    "computer"
  else
    "tie"
  end
end

def increment_score(winner, scores)
  if winner == "user"
    scores[:user] += 1
  elsif winner == "computer"
    scores[:computer] += 1
  end
end

def increment_round(rounds)
  rounds[:round] += 1
end

def three_wins?(scores)
  scores[:user] == 3 || scores[:computer] == 3
end

def play_again(input)
  input.downcase.start_with?('y')
end

clear
display_message("greeting")
wait_seconds(:half)
display_message("instructions")
blank_line
wait_seconds(:one)
get_input
clear

loop do # main loop
  scores = { user: 0, computer: 0 }
  rounds = { round: 1 }

  loop do
    display_message_with_values("round", rounds)
    choice = get_choice
    computer_choice = get_computer_choice

    match_winner = get_match_winner(choice, computer_choice)
    round_choices = { choice: choice, computer_choice: computer_choice }
    blank_line
    display_message_with_values("results", round_choices)
    blank_line
    display_message(match_winner)
    increment_score(match_winner, scores)
    display_message_with_values("match_score", scores)
    blank_line
    increment_round(rounds)

    break if three_wins?(scores)
  end

  wait_seconds(:half)
  blank_line
  display_message_with_values("final_score", scores)
  blank_line
  display_message winner(scores)
  wait_seconds(:one)
  blank_line
  display_message("play_again", prompt: true)

  user_input = get_input
  break unless play_again(user_input)
  clear
end
