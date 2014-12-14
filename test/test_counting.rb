require 'minitest'

load 'probaberry.rb'

class TestCounting < MiniTest::Test

  def setup
    @Epsilon = 5 * 10 ** -5
  end

  def test_1_choose_0
    assert_equal 1, 1.choose(0)
  end
    
  def test_1_choose_1
    assert_equal 1, 1.choose(1)
  end
    
  def test_30_choose_0
    assert_equal 1, 30.choose(0)
  end
    
  def test_30_choose_1
    assert_equal 30, 30.choose(1)
  end
    
  def test_30_choose_30
    assert_equal 1, 30.choose(30)
  end
    
  def test_30_choose_29
    assert_equal 30, 30.choose(29)
  end
    
  def test_30_choose_7
    assert_equal 2035800, 30.choose(7)
  end
    
  def test_30_choose_20
    assert_equal 30045015, 30.choose(20)
  end    
    
  def test_5_p_3
    assert_equal 60, npr(5, 3)
  end
    
  def test_6_p_3
    assert_equal 120, npr(6, 3)
  end
    
  def test_6_p_4
    assert_equal 360, npr(6, 4)
  end
    
end
