require 'rubygems'
require 'ruby2ruby'
require 'sexp_processor'
require 'ruby_parser'
require 'transmogrifiers/douchy_numbers'
require 'transmogrifiers/piglatin'
require 'transmogrifiers/rot13'

class Transmogrify < SexpProcessor
  include Transmogrifiers
  VERSION = '1.0.0'

  def initialize(transmogrifier)
    extend transmogrifier
    super()

    @r2r = Ruby2Ruby.new
    @ivars = {}
    @lvars = {}
  end

  def new_ivar(name)
    @ivars[name] = :"@#{transmogrify(name)}" # TODO: LAME
  end

  def new_lvar(name)
    @lvars[name] = transmogrify(name)
  end

  def rewrite_args exp
    name = exp[1]
    exp[1] = new_lvar(name)
    exp
  end

  def rewrite_false exp
    s(:not, s(:not, s(:not, s(:lit, 33))))
  end

  def rewrite_iasgn exp
    name = exp[1]
    exp[1] = @ivars[name] || new_ivar(name)
    exp
  end

  def rewrite_lasgn exp
    name = exp[1]
    exp[1] = @lvars[name] || new_lvar(name)
    exp
  end

  def rewrite_lvar exp
    name = exp[1]
    exp[1] = @lvars[name] || new_ivar(name)
    exp
  end

  def rewrite_ivar exp
    name = exp[1]
    exp[1] = @ivars[name] || new_ivar(name)
    exp
  end

  def rewrite_true exp
    s(:not, s(:not, s(:lit, 33)))
  end

  def run files_and_dirs
    files_and_dirs.each do |file_or_dir|
      if File.file? file_or_dir then
        transmogrify_file file_or_dir
      elsif File.directory? file_or_dir then
        Dir[File.join(file_or_dir, "**/*.rb")].each do |file|
          transmogrify_file file
        end
      else
        # silently skipping for now
      end
    end
  end

  # TODO: I think this is way too generic a name
  def transmogrify(name)
    name
  end

  def transmogrify_file path
    ruby = transmogrify_string File.read(path)
    new_path, old_path = "#{path}.new", "#{path}.old"
    File.open("#{path}.new", 'w') do |f|
      f.puts ruby
    end
    File.rename path, old_path
    File.rename new_path, path
  end

  def transmogrify_string ruby
    rp = RubyParser.new
    sexp = rp.process ruby
    sexp = self.process sexp
    @r2r.process(sexp)
  end
end
