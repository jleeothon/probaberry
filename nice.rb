def nice n, p=3
  return n unless n.kind_of? Numeric
  i = n.to_i
  f = ((n - i).round(p).to_s)[2..-1]
  i = i.to_s.reverse.gsub(/...(?=.)/, '\& ').reverse
  "#{i}.#{f}"
end
