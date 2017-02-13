require_relative 'bowling_frame'
require_relative 'mars_game'

class DivideShots

  def initialize(context)
    @context = context
  end

  def divide_list_in_frames(list)
    p 'tot pinss ' + @context.total_pins.to_s
    p 'venus ' + @context.venusian_rule?.to_s
    p 'tot framess ' + @context.total_frames.to_s

    @total_pins = @context.total_pins
    @total_frames = @context.total_frames

    @is_venusian_rule = @context.venusian_rule?


    if @context.instance_of? MarsGame
      divide_list_in_frames_mars(list)
    else
      divide_list_in_frames_earth(list)
    end
  end

  def divide_list_in_frames_earth(list)

    res = []
    i = 0
    frames_count = 0
    while i < list.size do
      frames_count += 1
      #ultimo frame aggiungi tutti quelli mancanti
      if frames_count == @total_frames
        set_last_frame(i, list, res)
        break
      else
        #strike al primo colpo
        if is_strike(list[i])
          res << BowlingFrame.new([list[i]], @total_pins)
          i += 1
          #due tiri
        else
          res << BowlingFrame.new([list[i], list[i + 1]], @total_pins)
          i += 2
        end
      end
      increase_pins_if_venus
    end
    res
  end

  def divide_list_in_frames_mars(list)
    res = []
    i = 0
    frames_count = 0
    while i < list.size do
      frames_count += 1
      #ultimo frame aggiungi tutti quelli mancanti
      if frames_count == @total_frames
        set_last_frame(i, list, res)
        break
      else
        #strike al primo colpo
        if is_strike(list[i])
          res << BowlingFrame.new([list[i]], @total_pins)
          i += 1
          #due tiri
        elsif is_strike(list[i] + list[i + 1])
          res << BowlingFrame.new([list[i], list[i + 1]], @total_pins)
          i += 2
        else
          res << BowlingFrame.new([list[i], list[i + 1], list[i + 2]], @total_pins)
          i += 3
        end
      end
      increase_pins_if_venus
    end
    res
  end

  def set_last_frame(i, list, frames)
    last_frame = []
    while i < list.size do
      last_frame << list[i]
      i += 1
    end
    frames << BowlingFrame.new(last_frame, @total_pins)
    reset_pins_number
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