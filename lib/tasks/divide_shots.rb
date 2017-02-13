require_relative 'bowling_frame'
require_relative 'mars_game'
class DivideShots
  def initialize(context)
    @context = context
    @frames_list = []
  end

  def divide_list_in_frames(list)
    @total_pins = @context.total_pins
    @is_venusian_rule = @context.venusian_rule?

    divide_list_in_frames_earth(list)
    @frames_list
  end

  def divide_list_in_frames_earth(list)
    list_cursor = frames_count =0
    while frames_count < @context.total_frames - 1 do
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

  def divide_earth(list_cursor, list)
    if is_strike(list[list_cursor])
      append_shots(list_cursor, list, 1)
      1
    else
      append_shots(list_cursor, list, 2)
      2
    end
  end

  def divide_mars(list_cursor, list)
    if is_strike(list[list_cursor])
      append_shots(list_cursor, list, 1)
      1
    elsif is_strike(list[list_cursor] + list[list_cursor + 1])
      append_shots(list_cursor, list, 2)
      2
    else
      append_shots(list_cursor, list, 3)
      3
    end
  end

  def append_shots(list_curosr, list, n_to_append)
    frame = []
    j = 0
    while j < n_to_append
      frame << list[list_curosr + j]
      j += 1
    end
    @frames_list << BowlingFrame.new(frame, @total_pins)
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