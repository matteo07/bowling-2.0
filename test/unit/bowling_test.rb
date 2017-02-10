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