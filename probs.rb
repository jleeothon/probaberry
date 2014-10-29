class Integer
  def !
    if self > 0
      (1..self).reduce :*
    elsif self.zero?
      1
    else
      raise ArgumentError, "No factorial for #{self}"
    end
  end
 
  alias :"!@" :!
  alias :fact :!
 
  def choose r
    raise ArgumentError, "r = #{r} is outside 0..#{self}" if r < 0 or r > self
    (self.!).fdiv((self - r).!).fdiv(r.!).to_i
  end
 
end
 
def nice n, p=3
  return n unless n.kind_of? Numeric
  i = n.to_i
  f = ((n - i).round(p).to_s)[2..-1]
  i = i.to_s.reverse.gsub(/...(?=.)/, '\& ').reverse
  "#{i}.#{f}"
end
 
def ncr n, r
  raise ArgumentError, "r = #{r} is outside 0..#{n}" if r < 0 or r > n
  n.choose r
end
 
def npr n, r
  raise ArgumentError, "r = #{r} is outside 0..#{n}" if r < 0 or r > n
  n.!.fdiv((n - r).!).to_i
end
 
def binomial(n, x, p)
  raise ArgumentError, "x=#{x} cannot be greater than n=#{n}" if x > n
  n.choose(x) * p ** x * (1 - p) ** (n - x)
end
