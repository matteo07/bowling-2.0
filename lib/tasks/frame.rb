module Frame

  def shoot(frame)
    if frame.length == 1
      shoot_strike frame[0]
    else
      shoot_frame frame[0], frame[1] || 0, frame[2] || 0
    end
  end

  def shoot_last(frame)
    if @is_callisto
      shoot_last_frame_callisto frame
    else
      shoot_last_frame frame[0], frame[1], frame[2] || 0, frame[3] || 0
    end
  end

  def shoot_frame(first, second, third)
    check_shot first, second
    @first_shot = first
    @second_shot = second
    shoot_first first
    shoot_second second
    shoot_third third
  end

  def shoot_strike(i)
    @is_strike = true
    @is_spare = false
    @score += i
  end

  def shoot_last_frame(first, second, third, last)
    @score += first + second + third + last
    if @is_spare
      @score += first
    elsif @is_strike
      @score += first + second + third + last
    end
  end

  def shoot_last_frame_callisto(list)
    i = 0
    while i < list.size do
      @score += list[i]
      i += 1
      if @is_spare && i == 0
        @score += list[i]
      end
    end
  end

  def shoot_first(first)
    @score += first
    if @is_spare || @is_strike
      @score += first
    end
  end

  def shoot_second(second)
    @score += second
    if @first_shot + second == @total_pins
      @is_spare = true
    else
      @is_spare = false
    end
    if @is_strike
      @score += second
    end
  end

  def shoot_third(third)
    @score += third
    if @first_shot + @second_shot + third == @total_pins
      @is_spare = true
    else
      @is_spare = false
    end
    if @is_strike
      @score += third
      @is_strike = false
    end
  end

  def check_shot(first, second, third = 0)
    if first > @total_pins
      raise 'first shot over ' + @total_pins.to_s
    elsif second > @total_pins
      raise 'second shot over ' + @total_pins.to_s
    elsif third > @total_pins
      raise 'third shot over ' + @total_pins.to_s
    elsif first + second + third > @total_pins
      raise 'sum of shots over ' + @total_pins.to_s
    end
  end

end
