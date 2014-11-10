Probaberry
==========

Tools to make a better irb-based calculator for probability homework. Because I'm sure that all my actuarial science classmates are dying for one.

Installation
------------

1. Install the [Ruby](https://www.ruby-lang.org/) language. After installing Ruby, you can usually access an [interactive Ruby shell](http://en.wikipedia.org/wiki/Interactive_Ruby_Shell) by typing the command `irb` .
2. Install [RubyGems](https://rubygems.org), the packaging system.
3. `gem install probaberry` will install the latest stable version. Disclaimer: stable means I haven't seen it crash.
4. Use it and have fun! From irb or any file, `require 'probaberry'`.

Probaberry was developed and manually tested on Ruby 2.1.2.

Printing numbers nicely
-----------------------

The global-scope `nice` function formats numbers in a more readable way. E.g. `nice 1024` yields `1 024.0`.

A useful trick that works in irb is to use the special underscore (`_`) variable (that represents the last value in the console).

```irb
require 'probaberry'
 => true 
3453453453
 => 3453453453 
nice _
 => "3 453 453 453.0"
```

You can also specify the number of decimals displayed using a second argument. Note that decimals will be rounded.

```irb
nice 0.344583, 4
=> "0.3446"
```

Counting problems
-----------------

Counting problems are usually based on the [rule of product](http://en.wikipedia.org/wiki/Rule_of_product). For which you do not need any special extra stuff. Ruby perfectly supports multiplication through the asterisk (`*`) operator. When the rule of product is applied to a an experiment repeatedly (with independent trials, etc.), remember the power operator `**`.

Examples:

Roll a balanced 6-sided die, then flip a coin. How many results can you have?

```irb
> 12 * 2
=> 24
```

Flip a coin ten times. How many results can you have?

```irb
> 2 ** 10
=> 1024
```

The one operation that we do not have official support for, though, is factorial. However, probaberry extends the `Integer` class to include it. There is three ways you can call the factorial: as the `!` method, the `fact` method, and the unary `!` operator.

```irb
> 5.!
=> 120
> 5.fact
=> 120
> !5
=> 120
```

The next big thing about counting is [combinations](http://en.wikipedia.org/wiki/Combination) and [permutations](http://en.wikipedia.org/wiki/Permutation). They can be computed with the `ncr` and `npr` functions, as in:

```irb
ncr 24, 11
=> 2496144
npr 24, 11
=> 99638080819200

# this is another "more readable" notation for combinations
24.choose 11
=> 2496144
```


Discrete distributions
----------------------

There is support for five discrete distributions:

1. Binomial, with `n` number of trials and `p` probability of success.
2. Poisson, with `la` lambda.
3. NegativeBinomial, with `n` number of successes and `p` probability of success.
4. Geometric, with `p` probability of success.
5. Hypergeometric, with `n` population size, `s` sample size, and `p` probability of success (in the population).

A random variable that follows a desired distribution can be instanced as any of such kinds, as spelled in the list aforementioned. For example, throw a biased coin (0.4 chance to get heads) ten times.

```irb
x = Binomial.new n=10, p=0.4
```

You can get the probability that your random variable be equal to a certain number. E.g. What is the probability that we get heads exactly 4 times?

```irb
x == 4
=> 0.250822656
```

Yes, the `==` operator was overloaded.

You can also get cumulative values by using other comparison operators, for example:

```irb
x < 7
=> 0.9452381184
```

Some obvious cases should also work.

```irb
x < 0
=> 0 
x >= 0
=> 1 
x <= 10
=> 1.0
```

**Be careful!** Remember that the equality and comparison operators have a lower precedence than arithmetic operators. The interpreter will complain if you attempt to write `1 - x < 3`. Instead, write `1 - (x < 3)`.

Contact me
-----------------------

Report any bug through GitHub ("issues"). Compliments accepted too.

Further reading
---------------

On discrete distributions:

1. [Binomial distribution](http://en.wikipedia.org/wiki/Binomial_distribution), that pertains Bernoulli trials.
2. [Poisson distribution](http://en.wikipedia.org/wiki/Poisson_distribution).
3. [Negative binomial distribution](http://en.wikipedia.org/wiki/Negative_binomial_distribution), related to binomial distributions.
4. [Geometric distribution](http://en.wikipedia.org/wiki/Geometric_distribution), which is a special case of a negative binomial distribution with n = 1.
5. [Hypergeometric distribution](http://en.wikipedia.org/wiki/Hypergeometric_distribution).
