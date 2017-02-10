module DivideShots

  def divide_list_in_frames(list)
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
          res << [list[i]]
          i += 1
          #due tiri
        else
          res << [list[i], list[i + 1]]
          i += 2
        end
      end
      increase_pins_if_venus
    end
    res
  end

  def divide_list_in_martian_frames(list)
    res = []
    i = 0
    frames_count = 0
    while i < list.size do
      frames_count += 1
      #ultimo frame aggiungi tutti quelli mancanti
      if frames_count == @total_frames
        set_last_frame(i, list, res)
        break
      end
      #strike al primo colpo
      if is_strike(list[i])
        res << [list[i]]
        i += 1
      elsif is_strike(list[i] + list[i + 1])
        res << [list[i], list[i + 1]]
        i += 2
        #tre tiri
      else
        res << [list[i], list[i + 1], list[i + 2]]
        i += 3
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
    frames << last_frame
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