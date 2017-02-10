require_relative 'game.rb'
require_relative 'divide_shots.rb'

class EarthGame < Game

  def initialize
    super
    @total_pins = 10
    @total_frames = 10
  end

  def play(list)
    frames = @shots_divider.divide_list_in_frames list
    play_frames(frames)
  end

  def total_pins
    @total_pins
  end

  def total_frames
    @total_frames
  end

end