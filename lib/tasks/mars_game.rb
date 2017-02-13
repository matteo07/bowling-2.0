require_relative '../../lib/tasks/game'
class MarsGame < Game
  def initialize
    super
    @total_frames = 14
  end
end