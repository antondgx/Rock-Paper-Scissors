class View
  def player_vs_ai_menu(hash_item)
    puts "Choose an option!"
    menu = []
    hash_item.each do |key, value|
      menu << "#{key} - #{value}"
    end
    puts menu.join(" | ") + " | m - Menu"
    gets.chomp.to_s
  end

  def ai_vs_ai_menu
    puts "Choose an option!"
    puts "1 - Start! | m - Menu"
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

  def animation(hash_item)
    hash_item.each do |_key, value|
      puts "#{value}!!"
      sleep(0.3)
    end
    puts ""
  end

  private

  def play_again
    puts ""
    puts "Let's go again!"
  end
end
