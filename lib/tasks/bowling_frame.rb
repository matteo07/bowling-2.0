class BowlingFrame

  @@is_strike = false
  @@is_spare = false
  
  def initialize(shots,total_pins)
    @shots = shots
    @total_pins = total_pins
    #p 'created ' + @shots.to_s + ' ' + @total_pins.to_s
  end
  
  def shoot
    if strike?
      shoot_strike @shots[0]
    else
      shoot_frame @shots[0], @shots[1] || 0, @shots[2] || 0
    end
  end

  def shoot_last
    #if @is_callisto
    #  shoot_last_frame_callisto frame
    #else
      shoot_last_frame @shots[0], @shots[1], @shots[2] || 0, @shots[3] || 0
    #end
  end

  def shoot_frame(first, second, third)
    res = 0
    check_shot first, second
    @first_shot = first
    @second_shot = second
    res += shoot_first first
    res += shoot_second second
    res += shoot_third third
    res
  end

  def shoot_strike(i)
    @@is_strike = true
    @@is_spare = false
    i
  end

  def shoot_last_frame(first, second, third, last)
    res = 0
    res += first + second + third + last
    if @@is_spare
      res += first
    elsif @@is_strike
      res += first + second + third + last
    end
    res
  end

  def shoot_last_frame_callisto(list)
    i = 0
    while i < list.size do
      @score += list[i]
      i += 1
      if @@is_spare && i == 0
        @score += list[i]
      end
    end
  end

  def shoot_first(first)
    res = 0
    res += first
    if @@is_spare || @@is_strike
      res += first
    end
    res
  end

  def shoot_second(second)
    res = 0
    res += second
    if @first_shot + second == @total_pins
      @@is_spare = true
    else
      @@is_spare = false
    end
    if @@is_strike
      res += second
    end
    res
  end

  def shoot_third(third)
    res = 0
    res += third
    if @first_shot + @second_shot + third == @total_pins
      @@is_spare = true
    else
      @@is_spare = false
    end
    if @@is_strike
      res += third
      @@is_strike = false
    end
    res
  end

  private

  def strike?
    @shots.length == 1
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
