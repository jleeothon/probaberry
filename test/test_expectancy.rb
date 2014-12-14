require 'minitest'

load 'probaberry.rb'

class TestExpectancy < MiniTest::Test

    def setup
        @Delta = 5 * 10 ** -5
    end

    def test_geometric_expectancy
        x = Geometric.new p=0.6
        assert_in_delta 1.666666, E(x), @Delta
    end

    def test_binomial_expectancy
        x = Binomial.new p=0.3, n=10
        assert_in_delta 3, E(x), @Delta
    end

    def test_hypergeometric_expectancy
        x = Hypergeometric.new n=10, s=4, p=0.4
        assert_in_delta 1.6, E(x), @Delta
    end

    def test_uniform_expectancy
        x = Uniform.new (-4), 8
        assert_in_delta (-4 + 8) / 2, E(x), @Delta
    end

    def test_exponential_expectancy
        x = Exponential.new 9
        assert_in_delta (1/9), E(x), @Delta
    end

end
