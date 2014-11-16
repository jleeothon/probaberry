module ContinuousVariable

  def == x
    0
  end

  def > x
    1 - self < x
  end

  alias_method :>= :>

  def between? x, y
    x, y = y, x if x > y # should this be necessary?
    (self < x) - (self < y)
  end

end

class Uniform
  
  include ContinuousVariable

  def initialize a, b
    @a = a
    @b = b
  end

  def < x
    x / (@b - @a)
  end

end
  
