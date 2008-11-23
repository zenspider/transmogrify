
require 'test/unit'
require 'transmogrify'

class TestTransmogrify < Test::Unit::TestCase
  def test_rewrite_lvar
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

    trans = Transmogrify.new
    actual = trans.process s

    assert_equal expected, actual
  end
end
