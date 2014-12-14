require 'minitest'

load 'probaberry.rb'

class TestGeometric < MiniTest::Test

  def setup
    @X = Geometric.new p=0.2
    @Delta = 5 * 10 ** -4
  end

  def test_equality_01
    assert_in_delta 0.2, @X == 1, @Delta
  end

  def test_equality_02
    assert_in_delta 0.102400, @X == 4, @Delta
  end
  
  def test_equality_03
    assert_in_delta 0.001181, @X == 24, @Delta
  end

  def test_less_than_01
    assert_equal 0, @X < 0
  end

  def test_less_than_02
    assert_equal 0, @X < 1
  end

  def test_less_than_03
    assert_in_delta 0.2, @X < 2, @Delta
  end

  def test_less_than_04
    assert_in_delta 0.67232, @X < 6, @Delta
  end

  def test_greater_equal_than
    assert_in_delta @X < 3, 1 - (@X >= 3), @Delta
  end

end
