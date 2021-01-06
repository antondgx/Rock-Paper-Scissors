class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts "Welcome to the Rock Paper Scissors game!"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.player_vs_ai
    when 2 then @controller.ai_vs_ai
    when 3 then stop
    else
      puts "Please choose 1, 2 or 3"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "Choose an option!"
    puts "1 - You versus AI robot"
    puts "2 - Watch two AI robots battle it out!"
    puts "3 - Exit game"
  end
end
