require_relative 'divide_shots.rb'
require_relative 'frame.rb'
class Bowling

  include Frame
  include DivideShots

  def start_game
    @total_pins = 10
    @total_frames = 10
    @score = 0
    @is_spare = false
    @is_strike = false
    @is_two_strike = false
    @is_martian_rule = false
    @is_venusian_rule = false
  end

  def play(list)
    if !@is_martian_rule
      frames = divide_list_in_frames list
    else
      frames = divide_list_in_martian_frames list
    end
    frames.each_with_index do |frame, i|
      if i != frames.length - 1
        shoot frame
      else   #last frame
        shoot_last frame
      end
      increase_pins_if_venus
    end
  end

  def get_score
    @score
  end

  def set_martian
    @is_martian_rule = true
    @total_frames = 14
  end

  def set_callisto
    @is_callisto = true
  end

  def set_venusian
    @is_venusian_rule = true
    @total_pins = 1
  end

end