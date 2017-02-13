require_relative '../test_case'
require_relative '../../lib/tasks/divide_shots'
require_relative '../../lib/tasks/game'

class CallistoTest < Test::Unit::TestCase
  setup do
    @game = Game.new
    @shots = []
  end

  def test_callisto
    @shots = [0,0   ,0,0    ,0,0   , 0,0    ,0,0    , 0,0   , 0,0   ,0,0   ,0,0   ,10,10,10,10,10]
    check_score(50)
  end

  def test_callisto_martian
    @shots = [ 0,0,0   ,0,0,0   ,0,0,0    ,0,0,0   ,0,0,0   ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0   ,0,0,0   ,10,10,10,10,10,10 ]
    @game = MarsGame.new
    check_score(60)
  end

  private
  def check_score(score)
    @game.play @shots
    assert_equal score, @game.get_score
  end
end