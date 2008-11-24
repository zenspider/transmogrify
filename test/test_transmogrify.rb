
require 'test/unit'
require 'transmogrify'

class TestTransmogrify < Test::Unit::TestCase
  include Transmogrifiers

  def test_rewrite_lvar_with_douchy_numbers
    s = RubyParser.new.process <<-RUBY
      number = 1
      string = 'string'
      puts number
      puts string
    RUBY

    expected = s(:block,
                 s(:lasgn, :douche01, s(:lit, 1)),
                 s(:lasgn, :douche02, s(:str, "string")),
                 s(:call, nil, :puts, s(:arglist, s(:lvar, :douche01))),
                 s(:call, nil, :puts, s(:arglist, s(:lvar, :douche02))))

    trans = Transmogrify.new(DouchyNumbers)
    actual = trans.process s

    assert_equal expected, actual
  end

  def test_rewrite_lvar_with_piglatin
    s = RubyParser.new.process <<-RUBY
      number = 1
      string = 'string'
      puts number
      puts string
    RUBY

    expected = s(:block,
                 s(:lasgn, :umbernay, s(:lit, 1)),
                 s(:lasgn, :ingstray, s(:str, "string")),
                 s(:call, nil, :puts, s(:arglist, s(:lvar, :umbernay))),
                 s(:call, nil, :puts, s(:arglist, s(:lvar, :ingstray))))

    trans = Transmogrify.new(Piglatin)
    actual = trans.process s

    assert_equal expected, actual
  end
end
