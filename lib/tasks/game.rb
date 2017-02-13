require_relative 'divide_shots'

class Game

  def initialize
    @shots_divider = DivideShots.new self
    @score = 0
    @total_pins = 10
    @total_frames = 10

    @is_venusian_rule = false
  end

  def play(list)
    frames = @shots_divider.divide_list_in_frames list
    shoot_all_frames(frames)
  end

  def shoot_all_frames(frames)
    frames.each_with_index do |frame, i|
      if i != frames.length - 1
        @score += frame.shoot
      else #last frame
        @score += frame.shoot_last
      end
    end
  end

  def set_callisto
    BowlingFrame.set_callisto
  end


  # ---------------------------------------------- VENUS RULE ----------------------------------------------

  def set_venusian_rule
    @is_venusian_rule = true
    @total_pins = 1
  end
  
  def venusian_rule?
    @is_venusian_rule
  end

# ---------------------------------------------- GETTERS ----------------------------------------------

  def total_pins
    @total_pins
  end

  def total_frames
    @total_frames
  end

  def get_score
    @score
  end

end