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
 
def ncr n, r
  raise ArgumentError, "r = #{r} is outside 0..#{n}" if r < 0 or r > n
  n.choose r
end
 
def npr n, r
  raise ArgumentError, "r = #{r} is outside 0..#{n}" if r < 0 or r > n
  n.!.fdiv((n - r).!).to_i
end
