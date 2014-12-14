require 'probaberry/counting.rb'
require 'probaberry/floatdivision.rb'

module Cumulative
  
  def < x
    (0...x).map{|i| self == i}.reduce(0, :+)
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
  
  def != x
    1 - (self == x)
  end

end


class Binomial

  include Cumulative
  attr_reader :n, :p
  
  def initialize n, p
    @n = n
    @p = p
  end
  
  def == x
    n.choose(x) * p ** x * (1 - p) ** (n - x)
  end

  def expected_value
    @n * @p
  end

end


class Poisson

  include Cumulative
  attr_reader :la
  
  def initialize la
    @la = la
  end
  
  def == x
    Math::exp(-la) * la ** x / x.!
  end

  def expected_value
    @la
  end

end


class NegativeBinomial
  include Cumulative
  attr_reader :n, :p
  
  def initialize n, p
    @n = n
    @p = p
  end
  
  def == x
    ncr.choose(x - 1, n - 1) * p ** n * (1 - p) ** (x - n)
  end

  def expected_value
    @n * @p / (1 - @p)
  end

end

class Geometric

  attr_reader :p
 
  def initialize p
    unless p > 0 and p < 1 then
      raise 'success rate should be greater than 0 and less than 1'
    end
    @p = p
  end
 
  def == x
    if x > 0 and x.integer? then
      p * (1 - p) ** (x - 1)
    else
      warn "x is not a positive integer" unless x.integer? or x > 0
      0
    end
  end
 
  def > x
    warn "x is not a positive integer" unless x.integer? or x > 0
    # tail lemma!
    if x > 0 then
      (1 - p) ** x.ceil
    else
      0
    end
  end
 
  def >= x
    warn "x is not a positive integer" unless x.integer? or x > 0
    (self == x) + (self > x)
  end
 
  def < x
    warn "x is not a positive integer" unless x.integer? or x > 0
    if x > 0
      1 - (self >= x)
    else
      
    end
  end
 
  def <= x
    warn "x is not a positive integer" unless x.integer? or x > 0
    1 - (self > x)
  end

  def expected_value
    1 / @p
  end

end

class Hypergeometric

  include Cumulative
  attr_reader :n, :s, :p

  def initialize n, s, p
    @n = n
    @s = s
    @p = p
  end

  def == x
    (ncr(n * p, x) * ncr(n * (1 - p), (s - x))).fdiv ncr(n, s)
  end

  def expected_value
    @s * @p
  end

end
