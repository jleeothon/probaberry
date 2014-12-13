require 'minitest/autorun'

load 'probaberry.rb'

class TestGeometric < MiniTest::Test

  def setup
    @X = Geometric.new p=0.2
    @Epsilon = 5 * 10 ** -4
  end

  def test_equality
    assert_in_epsilon 0.2, @X == 1, @Epsilon
    assert_in_epsilon 0.102400, @X == 4, @Epsilon
    assert_in_epsilon 0.001181, @X == 24, @Epsilon
  end

  def test_less_than
    assert_equal 0, @X < 0
    assert_equal 0, @X < 1
    assert_in_epsilon 0.2, @X < 2, @Epsilon
    assert_in_epsilon 0.67232, @X < 6, @Epsilon
  end

  def test_less_equal_than
  end

  def test_greater_than
  end

  def test_greater_equal_than
    assert_in_epsilon @X < 3, 1 - (@X >= 3), @Epsilon
  end

end
