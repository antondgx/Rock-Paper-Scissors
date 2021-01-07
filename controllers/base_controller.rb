require_relative "../view"

class BaseController
  def initialize
  end

  def player_vs_ai
    user_input = @view.player_vs_ai_menu(@input_mapping)
    converted_user_input = @input_mapping[user_input]
    ai_input = @choices_arr.sample

    print `clear`
    if user_input == "m"
      # wipe score and go back to menu
      @score[:player1] = 0
      @score[:player2] = 0
    else
      if @input_mapping.keys.include?(user_input)
        animation_effect
        print_result("You", converted_user_input, "Computer", ai_input)
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
      # wipe score and go back to menu
      @score[:player1] = 0
      @score[:player2] = 0
    else
      if user_input == "1"
        animation_effect
        ai_1_input = @choices_arr.sample
        ai_2_input = @choices_arr.sample

        print_result("AI-1", ai_1_input, "AI-2", ai_2_input)
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
      @score[:player1] += 1
    elsif input1 == input2
      @view.print_draw_result
    else
      @view.print_win_result(player2)
      @score[:player2] += 1
    end
    @view.display_score(@score, player1, player2)
  end

  def animation_effect
    @view.animation(@input_mapping)
  end
end
