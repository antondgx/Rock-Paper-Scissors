class View
  def display_player_vs_ai
    puts "Choose an option!"
    puts "q - Rock | w - Paper | e - Scissors | m - Menu"
    gets.chomp.to_s
  end

  def display_ai_vs_ai
    puts "Choose an option!"
    puts "s - Start! | m - Menu"
    gets.chomp.to_s
  end

  def print_both_inputs(player1, input1, player2, input2)
    puts "#{player1} chose #{input1} and #{player2} chose #{input2}"
  end

  def print_win_result(who)
    puts "***#{who} win this round!***"
    play_again
  end

  def print_draw_result
    puts "***It's a draw!***"
    play_again
  end

  def invalid_input
    puts "Invalid input. Try again!"
    puts ""
  end

  def animation
    puts "Rock.."
    sleep(0.5)
    puts "Paper..."
    sleep(0.5)
    puts "Scissors!!!"
    sleep(0.5)
    puts ""
  end

  private

  def play_again
    puts ""
    puts "Let's go again!"
  end
end
