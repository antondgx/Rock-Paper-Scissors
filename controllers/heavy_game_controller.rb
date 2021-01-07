require_relative 'base_controller'

class HeavyGameController < BaseController
  def initialize
    @view = View.new

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
end
