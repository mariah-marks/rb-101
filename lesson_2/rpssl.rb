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

def store_choice(choice, arr)
  arr << choice
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

def pair_with_key(value, score: false)
  results = {}
  fields = score ? [:user, :computer] : [:choice, :computer_choice]

  fields.each_with_index do |field, idx|
    results[field] = value[idx]
  end
  results
end

def winner(scores)
  if scores[0] > scores[1]
    "won"
  elsif scores[1] > scores[0]
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

def format_choices(choices)
  choices.join ", "
end

def play_again(input)
  input.downcase.start_with?('y')
end

clear
display_message "greeting"
wait_seconds(:half)
display_message "hint"

loop do # main loop
  score = { user: 0, computer: 0 }
  user_choices = []
  computer_choices = []

  loop do
    choice = get_choice
    store_choice(choice, user_choices)

    computer_choice = get_computer_choice
    store_choice(computer_choice, computer_choices)

    match_winner = round_winner(choice, computer_choice)
    keep_score(match_winner, score)

    break if three_wins?(score)
  end

  user_choices = format_choices(user_choices)
  computer_choices = format_choices(computer_choices)

  clear
  wait_seconds(:half)
  match_choices = [user_choices, computer_choices]
  match_scores = [score[:user], score[:computer]]
  results = pair_with_key(match_choices)
  final_score = pair_with_key(match_scores, score: true)

  display_with_value("results", results)
  wait_seconds(:half)
  display_with_value("display_score", final_score)
  display_message winner(match_scores)
  wait_seconds(:one)
  blank_line
  display_message "play_again", prompt: true

  user_input = get_input
  break unless play_again(user_input)
  clear
end
