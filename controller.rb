require_relative "view"

class Controller
  def initialize
    @view = View.new

    # Rock Paper Scissors mode
    @win_condition = ["Rock Scissors", "Paper Rock", "Scissors Paper"]
    @draw_condition = ["Rock Rock", "Paper Paper", "Scissors Scissors"]
    @choices_arr = ["Rock", "Paper", "Scissors"]
    @input_conversion = {
      "q" => "Rock",
      "w" => "Paper",
      "e" => "Scissors"
    }

    # App could be extended to Rock Paper Scissors Spock Lizard mode by uncommenting the below:
    # @win_condition = ["Rock Scissors", "Rock Lizard", "Paper Rock", "Paper Spock", "Scissors Paper", "Scissors Lizard", "Spock Rock", "Spock Scissors", "Lizard Spock", "Lizard Paper"]
    # @draw_condition = ["Rock Rock", "Paper Paper", "Scissors Scissors", "Spock Spock", "Lizard Lizard"]
    # @choices_arr = ["Rock", "Paper", "Scissors", "Spock", "Lizard"]
    # @input_conversion = {
    #   "q" => "Rock",
    #   "w" => "Paper",
    #   "e" => "Scissors"
    #   "r" => "Spock"
    #   "t" => "Lizard"
    # }
  end

  def player_vs_ai
    user_input = @view.display_player_vs_ai
    converted_user_input = @input_conversion[user_input]
    ai_input = @choices_arr.sample

    print `clear`
    if user_input == "m"
      # end function and back to menu
    else
      if ["q", "w", "e"].include?(user_input)
        animation_effect
        print_result("You", converted_user_input, "AI", ai_input)
      else
        @view.invalid_input
      end
      player_vs_ai
    end
  end

  def ai_vs_ai
    user_input = @view.display_ai_vs_ai

    print `clear`
    if user_input == "m"
      # end function and back to menu
    else
      if user_input == "s"
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
    if @win_condition.include?(result.join(" "))
      @view.print_win_result(player1)
    elsif @draw_condition.include?(result.join(" "))
      @view.print_draw_result
    else
      @view.print_win_result(player2)
    end
  end

  def animation_effect
    @view.animation
  end
end
