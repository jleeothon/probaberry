require 'minitest/autorun'

load 'probaberry.rb'

class TestExpectancy < MiniTest::Test

    def setup
        @Epsilon = 5 * 10 ** -5
    end

    def test_geometric_expectancy
        x = Geometric.new p=0.6
        assert_in_epsilon 1.666666, E(x), @Epsilon
    end

    def test_binomial_expectancy
        x = Binomial.new p=0.3, n=10
        assert_in_epsilon 0, E(x), @Epsilon
    end

    def test_hypergeometric_expectancy
        x = Hypergeometric.new p=0.4, n=3
        assert_in_epsilon 0, E(x), @Epsilon
    end

    def test_uniform_expectancy
        x = Uniform.new a=-4, b=8
        assert_in_epsilon 0, E(x), @Epsilon
    end

    def test_exponential_expectancy
        x = Exponential.new la = 9
        assert_in_epsilon 0, E(x), @Epsilon
    end

end
