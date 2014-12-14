require 'minitest'

load 'probaberry.rb'

class TestUniform < MiniTest::Test

  def setup
    @X = Uniform.new a=-2, b=8
    @Epsilon = 5 * 10 ** -4
  end

  def test_equality_01
    assert_in_epsilon 0.2, @X == 1, @Epsilon
  end  

  def test_equality_02
    assert_in_epsilon 0.102400, @X == 4, @Epsilon
  end

  def test_equality_03
    assert_in_epsilon 0.001181, @X == 24, @Epsilon
  end

  def test_less_than_01
    assert_equal 0, @X < 0
  end

  def test_less_than_02
    assert_equal 0, @X < 1
  end

  def test_less_than_03
    assert_in_epsilon 0.2, @X < 2, @Epsilon
  end

  def test_less_than_04
    assert_in_epsilon 0.67232, @X < 6, @Epsilon
  end

  def test_less_equal_than
    skip
  end

  def test_greater_than
    skip
  end

  def test_greater_equal_than
    assert_in_epsilon @X < 3, 1 - (@X >= 3), @Epsilon
  end

end

