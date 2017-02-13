require_relative '../test_case'
require_relative '../../lib/tasks/mars_game'

class MarsGameTest < Test::Unit::TestCase
  setup do
    @game = MarsGame.new
    @shots = []
  end

  def test_a_martian_spare
    @shots = [ 3,3,4   ,5,0,0   ,0,0,0    ,0,0,0   ,0,0,0   ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0   ,0,0,0   ,0,0,0 ]
    check_score(20)
  end

  def test_final_martian_spare
    @shots = [ 0,0,0   ,0,0,0   ,0,0,0    ,0,0,0   ,0,0,0   ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0   ,0,0,0  ,3,3,4,2]
    check_score(12)
  end

  def test_a_martian_strike
    @shots = [ 10     ,5,0      ,0,10     ,2,0,0   ,0,0,0   ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0   ,0,0,0   ,0,0,0 ]
    check_score(34)
  end

  private

  def check_score(score)
    @game.play @shots
    assert_equal score, @game.get_score
  end
end