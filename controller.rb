require_relative "view"

class Controller
  def initialize
    @view = View.new

    # Rock Paper Scissors mode
    # @player1_win_condition = ["Rock Scissors", "Paper Rock", "Scissors Paper"]
    # @choices_arr = ["Rock", "Paper", "Scissors"]
    # @input_mapping = {
    #   "1" => "Rock",
    #   "2" => "Paper",
    #   "3" => "Scissors"
    # }

    # Rock Paper Scissors Spock Lizard mode
    @player1_win_condition = ["Rock Scissors", "Rock Lizard", "Paper Rock", "Paper Spock", "Scissors Paper", "Scissors Lizard", "Spock Rock", "Spock Scissors", "Lizard Spock", "Lizard Paper"]
    @choices_arr = ["Rock", "Paper", "Scissors", "Spock", "Lizard"]
    @input_mapping = {
      "1" => "Rock",
      "2" => "Paper",
      "3" => "Scissors",
      "4" => "Spock",
      "5" => "Lizard"
    }
  end

  def player_vs_ai
    user_input = @view.player_vs_ai_menu(@input_mapping)
    converted_user_input = @input_mapping[user_input]
    ai_input = @choices_arr.sample

    print `clear`
    if user_input == "m"
      # end function and back to menu
    else
      if @input_mapping.keys.include?(user_input)
        animation_effect
        print_result("You", converted_user_input, "AI", ai_input)
      else
        @view.invalid_input
      end
      player_vs_ai
    end
  end

  def ai_vs_ai
    user_input = @view.ai_vs_ai_menu

    print `clear`
    if user_input == "m"
      # end function and back to menu
    else
      if user_input == "1"
        animation_effect
        ai_1_input = @choices_arr.sample
        ai_2_input = @choices_arr.sample

        print_result("AI 1", ai_1_input, "AI 2", ai_2_input)
      else
        @view.invalid_input
      end
      ai_vs_ai
    end
  end

  private

  def print_result(player1, input1, player2, input2)
    result = []
    @view.print_both_inputs(player1, input1, player2, input2)
    result << input1 << input2
    if @player1_win_condition.include?(result.join(" "))
      @view.print_win_result(player1)
    elsif input1 == input2
      @view.print_draw_result
    else
      @view.print_win_result(player2)
    end
  end

  def animation_effect
    @view.animation(@input_mapping)
  end
end
