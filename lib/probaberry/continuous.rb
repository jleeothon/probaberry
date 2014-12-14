module ContinuousVariable

  def == x
    0
  end

  def > x
    1 - (self < x)
  end

  alias_method :>=, :>

  def between? x, y
    x, y = y, x if x > y # should this be necessary?
    (self < x) - (self < y)
  end

end

class Uniform
  
  include ContinuousVariable

  attr_reader :a, :b

  def initialize a, b
    @a = a
    @b = b
  end

  def < x
    x / (@b - @a)
  end

  def expected_value
    (a + b) / 2
  end

end
  
class Exponential
  
  include ContinuousVariable

  attr_reader :la
  
  def initialize la
    @la = la
  end
  
  def < x
    1 - Math::exp(- @la * x)
  end
  
  def expected_value
    1 / @la
  end

end
