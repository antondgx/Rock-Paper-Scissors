class Router
  def initialize(game_controller1, game_controller2)
    @light_game_controller = game_controller1
    @heavy_game_controller = game_controller2
    @running = true

    # light_game_controller => Rock Paper Scissors
    # heavy_game_controller => Rock Paper Scissors Spock Lizard
  end

  def run
    puts "Welcome to the Rock Paper Scissors Game!"
    puts "           --           "

    while @running
      display_game_modes
      action = gets.chomp.to_i
      print `clear`
      route_game_mode(action)
    end
  end

  private

  def route_game_mode(action)
    case action
    when 1
      display_game_options
      action = gets.chomp.to_i
      print `clear`
      route_game_option(action, @light_game_controller)
    when 2
      display_game_options
      action = gets.chomp.to_i
      print `clear`
      route_game_option(action, @heavy_game_controller)
    when 3
      stop
    else
      puts "Please choose an option!"
    end
  end

  def route_game_option(action, game_controller)
    case action
    when 1
      game_controller.player_vs_ai
    when 2
      game_controller.ai_vs_ai
    when 3
      stop
    else
      puts "Please choose an option!"
    end
  end

  def stop
    @running = false
  end

  def display_game_modes
    puts ""
    puts "Choose a Game Mode!"
    puts "1 - Rock Paper Scissors"
    puts "2 - Rock Paper Scissors Game Spock Lizard"
    puts "3 - Exit"
  end

  def display_game_options
    puts ""
    puts "Choose an option!"
    puts "1 - You versus AI robot"
    puts "2 - Watch two AI robots battle it out!"
    puts "3 - Exit"
  end
end
