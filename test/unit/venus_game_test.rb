require_relative '../test_case'
require_relative '../../lib/tasks/earth_game'

class VenusGameTest < Test::Unit::TestCase

  setup do
    @game = EarthGame.new
    @shots = []
  end

  def test_venusian_spare
    @shots = [0,0   ,1,1    ,1,0   , 0,0    ,0,0    , 0,0   , 0,0   ,0,0   ,0,0   ,0,0,0]
    check_score(4)
  end

  def test_venusian_strike
    @shots = [0,0   ,0,0    ,3   , 3,0    ,0,0    , 0,0   , 0,0   ,0,0   ,0,0   ,0,0,0]
    check_score(9)
  end

  def test_venusian_martian_spare
    @shots = [ 0,0,0   ,0,0,0   ,1,1,1    ,3,0,0   ,0,0,0   ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0   ,0,0,0   ,0,0,0 ]
    @game = MarsGame.new
    check_score(9)
  end

  # def test_venus_mars_spare_and_call
  #   @shots = [ 0,0,0   ,0,0,0   ,1,1,1    ,3,0,0   ,0,0,0   ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0  ,0,0,0   ,0,0,0   ,14,14,14,14,14 ]
  #   @bowling.set_martian
  #   @bowling.set_callisto
  #   check_venus_score(79)
  # end
  #
  # def test_venus_strike_and_callisto
  #   @shots = [0,0   ,0,0    ,3   , 2,1    ,0,0    , 0,0   , 0,0   ,0,0   ,0,0   ,10,10,10,10,10]
  #   @bowling.set_callisto
  #   check_venus_score(59)
  # end

  private

  def check_score(score)
    @game.set_venusian_rule
    @game.play @shots
    assert_equal score, @game.get_score
  end


end