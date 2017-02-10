require_relative '../test_case'

class BowlingTest < Test::Unit::TestCase

  def setup
    @bowling = Bowling.new
    @bowling.start_game
    @shots = []
  end


  def test_all_zeros
    20.times do
      @shots << 0
    end
    check_score(0)
  end

  def test_all_ones
    20.times do
      @shots << 1
    end
    check_score(20)
  end

  def test_no_spare
    @shots = [0,0   ,0,0    ,3,4   , 6,2    ,0,0    , 0,0   , 0,0   ,0,0   ,0,0   ,0,0]
    check_score(15)
  end

  def test_a_spare
    @shots = [0,0   ,0,0    ,3,7   , 6,2    ,0,0    , 0,0   , 0,0   ,0,0   ,0,0   ,0,0]
    check_score(24)
  end

  def test_final_spare
    @shots = [0,0   ,0,0    ,0,0   , 0,0    ,0,0    , 0,0   , 0,0   ,0,0   ,0,0   ,3,7,2]
    check_score(12)
  end

  def test_a_strike
    @shots = [0,0   ,0,0    ,0,0   , 10    ,2,3    , 4,0   , 0,0   ,0,0   ,0,0   ,0,0]

    check_score(24)
  end

  def test_final_strike
    @shots = [0,0   ,0,0    ,0,0   , 0,0    ,0,0    , 0,0   , 0,0   ,0,0   ,0,0   ,10,7,2]
    check_score(19)
  end

  # ------------------------------------------- MARTIAN -------------------------------------------

  def test_a_martian_spare
    @shots = [ 3,3,4   ,5,0,0   ,0,0,0    ,0,0,0   ,0,0,0   ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0   ,0,0,0   ,0,0,0 ]
    check_martian_score(20)
  end

  def test_final_martian_spare
    @shots = [ 0,0,0   ,0,0,0   ,0,0,0    ,0,0,0   ,0,0,0   ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0   ,0,0,0  ,3,3,4,2]
    check_martian_score(12)
  end

  def test_a_martian_strike
    @shots = [ 10     ,5,0      ,0,10     ,2,0,0   ,0,0,0   ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0   ,0,0,0   ,0,0,0 ]
    check_martian_score(34)
  end

  # ------------------------------------------- CALLISTO -------------------------------------------

  def test_callisto
    @shots = [0,0   ,0,0    ,0,0   , 0,0    ,0,0    , 0,0   , 0,0   ,0,0   ,0,0   ,10,10,10,10,10]
    check_callisto_score(50)
  end

  def test_callisto_martian
    @shots = [ 0,0,0   ,0,0,0   ,0,0,0    ,0,0,0   ,0,0,0   ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0   ,0,0,0   ,10,10,10,10,10,10 ]
    @bowling.set_martian
    check_callisto_score(60)
  end

  # ------------------------------------------- VENUS -------------------------------------------

  def test_venusian_spare
    @shots = [0,0   ,1,1    ,1,0   , 0,0    ,0,0    , 0,0   , 0,0   ,0,0   ,0,0   ,0,0,0]
    check_venus_score(4)
  end

  def test_venusian_strike
    @shots = [0,0   ,0,0    ,3   , 3,0    ,0,0    , 0,0   , 0,0   ,0,0   ,0,0   ,0,0,0]
    check_venus_score(9)
  end

  def test_venusian_martian_spare
    @shots = [ 0,0,0   ,0,0,0   ,1,1,1    ,3,0,0   ,0,0,0   ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0   ,0,0,0   ,0,0,0 ]
    @bowling.set_martian
    check_venus_score(9)
  end

  def test_venus_mars_spare_and_call
    @shots = [ 0,0,0   ,0,0,0   ,1,1,1    ,3,0,0   ,0,0,0   ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0   ,0,0,0   ,14,14,14,14,14 ]
    @bowling.set_martian
    @bowling.set_callisto
    check_venus_score(79)
  end

  def test_venus_strike_and_callisto
    @shots = [0,0   ,0,0    ,3   , 2,1    ,0,0    , 0,0   , 0,0   ,0,0   ,0,0   ,10,10,10,10,10]
    @bowling.set_callisto
    check_venus_score(59)
  end



  private

  def check_score(score)
    @bowling.play @shots
    assert_equal score, @bowling.get_score
  end

  def check_martian_score(score)
    @bowling.set_martian
    check_score score
  end

  def check_callisto_score(score)
    @bowling.set_callisto
    check_score score
  end

  def check_venus_score(score)
    @bowling.set_venusian
    check_score score
  end

end