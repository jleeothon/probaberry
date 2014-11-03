load 'discrete.rb'

X = Binomial.new n=10, p=0.4

puts X == 0
puts X == 1
puts ((X == 1) + (X == 0))
puts X < 2
puts X >= 0
