module Cumulative
  def < x
    m = (0...x).map{|i| self == i}.reduce(0, :+)
  end
  def <= x
    (self == x ) + (self < x)
  end
  def > x
    1 - (self <= x)
  end
  def >= x
    1 - (self < x)
  end
  def inbetween? x, y
    (self <= y) - (self < x)
  end
  def exbetween?
    (self < y) - (self < x - 1)
  end
end

class Binomial
  include Cumulative
  attr_accessor :n, :p
  def initialize n, p
    @n = n
    @p = p
  end
  def == x
    n.choose(x) * p ** x * (1 - p) ** (n - x)
  end
end

class Poisson
  include Cumulative
  attr_accessor :la
  def initialize la
    @la = la
  end
  def == x
    Math::exp(-la) * la ** x / x.!
  end
end

class NegativeBinomial
  include Cumulative
  attr_accessor :n, :p
  def initialize n, p
    @n = n
    @p = p
  end
  def == x
    ncr.choose(x - 1, n - 1) * p ** n * (1 - p) ** (x - n)
  end
end

class Geometric
  attr_accessor :p
  def initialize p
    @p = p
  end
  def == x
    p * (1 - p) ** (x - 1)
  end
  def > x
    # tail lemma!
    (1 - p) ** x
  end
  def >= x
    (self == x) + (self > x)
  end
  def < x
    1 - (self >= x)
  end
  def <= x
    1 - (self > x)
  end
end

class Hypergeometric
  include Cumulative
  attr_accessor :n, :s, :p
  def initialize
    @n = n
    @s = s
    @p = p
  end
  def == x
    (ncr(n * p, x) * ncr(n * (1 - p), (s - x))).fdiv ncr(n, s)
  end

end
