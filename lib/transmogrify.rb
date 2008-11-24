require 'rubygems'
require 'ruby2ruby'
require 'sexp_processor'
require 'ruby_parser'
require 'transmogrifiers/douchy_numbers'
require 'transmogrifiers/piglatin'

class Transmogrify < SexpProcessor
  include Transmogrifiers
  VERSION = '1.0.0'

  def initialize(transmogrifier)
    extend transmogrifier
    super()

    @r2r = Ruby2Ruby.new
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
