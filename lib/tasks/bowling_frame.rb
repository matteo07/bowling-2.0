class BowlingFrame
  @@is_strike = false
  @@is_spare = false
  
  def initialize(shots,total_pins)
    @shots = shots
    @total_pins = total_pins
  end
  
  def shoot
    if @shots.length == 1
      @@is_strike = true
      @@is_spare = false
      @shots[0]
    else
      shoot_frame
    end
  end

  def shoot_frame
    res = @@is_strike ? (frame_total) * 2 : frame_total
    res += @@is_spare ? @shots[0] : 0

    if @@is_strike
      @@is_strike = false
    end
    @@is_spare = (frame_total == @total_pins) ? true : false
    res
  end

  def frame_total
    @shots.inject(0){|sum,x| sum + x}
  end
end