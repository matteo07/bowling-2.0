require_relative 'bowling_frame'
require_relative 'mars_game'
class DivideShots
  def initialize(context)
    @context = context
    @frames_list = []
  end

  def divide_list_in_frames(list)
    @total_pins = @context.total_pins
    @total_frames = @context.total_frames
    @is_venusian_rule = @context.venusian_rule?

    divide_list_in_frames_earth(list)
    @frames_list
  end

  def divide_list_in_frames_earth(list)
    list_cursor = frames_count =0
    while frames_count < @total_frames - 1 do
      frames_count += 1
      if @context.instance_of? MarsGame
        list_cursor += divide_mars(list_cursor, list)
      else
        list_cursor += divide_earth(list_cursor, list)
      end
      increase_pins_if_venus
    end
    @frames_list << BowlingFrame.new(list.last(list.length - list_cursor),@total_pins)
    reset_pins_number
  end

  def divide_earth(i, list)
    if is_strike(list[i])
      @frames_list << BowlingFrame.new([list[i]], @total_pins)
      1
    else
      @frames_list << BowlingFrame.new([list[i], list[i + 1]], @total_pins)
      2
    end
  end

  def divide_mars(i, list)
    if is_strike(list[i])
      @frames_list << BowlingFrame.new([list[i]], @total_pins)
      1
    elsif is_strike(list[i] + list[i + 1])
      @frames_list << BowlingFrame.new([list[i], list[i + 1]], @total_pins)
      2
    else
      @frames_list << BowlingFrame.new([list[i], list[i + 1], list[i + 2]], @total_pins)
      3
    end
  end

  def reset_pins_number
    if @is_venusian_rule
      @total_pins = 1
    end
  end

  def increase_pins_if_venus
    if @is_venusian_rule
      @total_pins += 1
    end
  end

  def is_strike(shot)
    shot == @total_pins
  end
end