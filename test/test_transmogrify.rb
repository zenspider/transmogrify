
require 'test/unit'
require 'transmogrify'

class TestTransmogrify < Test::Unit::TestCase
  include Transmogrifiers

  def setup
    # number = 1
    # string = 'string'
    # puts number
    # puts string

    @lvar_sexp = s(:block,
                   s(:lasgn, :number, s(:lit, 1)),
                   s(:lasgn, :string, s(:str, "string")),
                   s(:call, nil, :puts, s(:arglist, s(:lvar, :number))),
                   s(:call, nil, :puts, s(:arglist, s(:lvar, :string))))

    # def x arg
    #   y = 42
    #   y + arg
    # end

    @defn_sexp = s(:defn, :x, s(:args, :arg),
                   s(:scope,
                     s(:block,
                       s(:lasgn, :y, s(:lit, 42)),
                       s(:call, s(:lvar, :y), :+,
                         s(:arglist, s(:lvar, :arg))))))

  #  @number = 1
  #  @string = 'string'
  #  puts @number
  #  puts @string

    @iasgn_sexp = s(:block,
                    s(:iasgn, :@number, s(:lit, 1)),
                    s(:iasgn, :@string, s(:str, "string")),
                    s(:call, nil, :puts, s(:arglist, s(:ivar, :@number))),
                    s(:call, nil, :puts, s(:arglist, s(:ivar, :@string))))
  end

  def test_rewrite_lvar_with_douchy_numbers
    expected = s(:block,
                 s(:lasgn, :douche01, s(:lit, 1)),
                 s(:lasgn, :douche02, s(:str, "string")),
                 s(:call, nil, :puts, s(:arglist, s(:lvar, :douche01))),
                 s(:call, nil, :puts, s(:arglist, s(:lvar, :douche02))))

    trans = Transmogrify.new(DouchyNumbers)
    actual = trans.process @lvar_sexp

    assert_equal expected, actual
  end

  def test_rewrite_lvar_defn_args
    expected = s(:defn, :x, s(:args, :douche01),
                 s(:scope,
                   s(:block,
                     s(:lasgn, :douche02, s(:lit, 42)),
                     s(:call, s(:lvar, :douche02), :+,
                       s(:arglist, s(:lvar, :douche01))))))

    trans = Transmogrify.new(DouchyNumbers)
    actual = trans.process @defn_sexp

    assert_equal expected, actual
  end

  def test_rewrite_ivar_with_douchy_numbers
    expected = s(:block,
                 s(:iasgn, :@douche01, s(:lit, 1)),
                 s(:iasgn, :@douche02, s(:str, "string")),
                 s(:call, nil, :puts, s(:arglist, s(:ivar, :@douche01))),
                 s(:call, nil, :puts, s(:arglist, s(:ivar, :@douche02))))
    trans = Transmogrify.new(DouchyNumbers)
    actual = trans.process @iasgn_sexp

    assert_equal expected, actual
  end

  def test_rewrite_lvar_with_piglatin
    expected = s(:block,
                 s(:lasgn, :umbernay, s(:lit, 1)),
                 s(:lasgn, :ingstray, s(:str, "string")),
                 s(:call, nil, :puts, s(:arglist, s(:lvar, :umbernay))),
                 s(:call, nil, :puts, s(:arglist, s(:lvar, :ingstray))))

    trans = Transmogrify.new(Piglatin)
    actual = trans.process @lvar_sexp

    assert_equal expected, actual
  end
end
