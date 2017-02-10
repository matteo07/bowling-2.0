class Game

  def initialize
    @shots_divider = DivideShots.new self
    @score = 0
  end

  def play(list)
    frames = divide_list_in_frames list
    play_frames(frames)
  end

  def play_frames(frames)
    frames.each_with_index do |frame, i|
      if i != frames.length - 1
        @score += frame.shoot
      else #last frame
        @score += frame.shoot_last
      end
    end
  end

  def get_score
    @score
  end

end
