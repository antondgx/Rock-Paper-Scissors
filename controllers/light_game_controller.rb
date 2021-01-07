require_relative 'base_controller'

class LightGameController < BaseController
  def initialize
    @view = View.new

    @player1_win_condition = ["Rock Scissors", "Paper Rock", "Scissors Paper"]
    @choices_arr = ["Rock", "Paper", "Scissors"]
    @input_mapping = {
      "1" => "Rock",
      "2" => "Paper",
      "3" => "Scissors"
    }

    # for keeping score in a game
    @score = {
      player1: 0,
      player2: 0
    }
  end
end
