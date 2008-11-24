require 'rubygems'
require 'ruby2ruby'
require 'sexp_processor'
require 'ruby_parser'

$:.unshift File.dirname(__FILE__)
require 'transmogrifiers/douchy_numbers'
require 'transmogrifiers/piglatin'

class Transmogrify < SexpProcessor
  include Transmogrifiers
  VERSION = '1.0.0'

  def initialize(transmogrifier)
    extend transmogrifier
    super()

    @lvars = {}
  end

  def rewrite_lasgn exp
    name = exp[1]
    exp[1] = @lvars[name] = new_lvar(name)
    exp
  end

  def rewrite_lvar exp
    name = exp[1]
    exp[1] = @lvars[name]
    exp
  end

  def new_lvar(name)
    transmogrify(name)
  end

  private

  def transmogrify(name)
    name
  end
end
