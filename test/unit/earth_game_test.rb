require_relative '../test_case'
require_relative '../../lib/tasks/divide_shots'
require_relative '../../lib/tasks/game'

class GameTest < Test::Unit::TestCase
  setup do
    @game = Game.new
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
    @game.play @shots
    assert_equal score, @game.get_score
  end
end