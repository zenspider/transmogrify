require 'rubygems'
require 'ruby2ruby'
require 'sexp_processor'
require 'ruby_parser'

class Transmogrify < SexpProcessor
  VERSION = '1.0.0'

  def initialize
    super

    @lvar_count = 0
    @lvars = {}
  end

  def rewrite_lasgn exp
    name = exp[1]
    exp[1] = @lvars[name] = new_lvar
    exp
  end

  def rewrite_lvar exp
    name = exp[1]
    exp[1] = @lvars[name]
    exp
  end

  def new_lvar
    @lvar_count += 1
    :"douche#{'%02d' % @lvar_count}"
  end
end
