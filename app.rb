require_relative 'controllers/light_game_controller'
require_relative 'controllers/heavy_game_controller'
require_relative 'router'

light_game_controller = LightGameController.new
heavy_game_controller = HeavyGameController.new

router = Router.new(light_game_controller, heavy_game_controller)

# Start the app
router.run
