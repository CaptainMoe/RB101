
VALID_CHOICE = ['rock', 'paper', 'scissors']

WINING_CONDTIONS = {
  'rock' => 'scissors',
  'paper' => 'rock',
  'scissors' => 'paper'
}

def prompt(message)
  puts("=>#{message}")
end

def display_resutls(player_choice, computer_choice)
  if WINING_CONDTIONS[player_choice] == computer_choice
    prompt("You won!")
  elsif WINING_CONDTIONS[computer_choice] == player_choice
    prompt("computer won!")
  else
    prompt("It is a tie")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose #{VALID_CHOICE.join(', ')}")
    choice = gets.chomp

    break if VALID_CHOICE.include?(choice)
    prompt("That is not a valid choice")
  end

  computer_choice = VALID_CHOICE.sample

  prompt("You chose: #{choice}. computer_choice: #{computer_choice}")

  display_resutls(choice, computer_choice)

  prompt "Do you want to play again?"
  ans = gets.chomp
  break unless ans.downcase.start_with?('y')
end
