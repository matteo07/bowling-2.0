require_relative 'game.rb'
require_relative 'divide_shots.rb'

class MarsGame < Game

  def initialize
    super
    @total_frames = 14
  end

end