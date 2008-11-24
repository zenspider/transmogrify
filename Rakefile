# -*- ruby -*-

require 'rubygems'
require 'hoe'

%w(sexp_processor ruby_parser ruby2ruby).each do |project|
  Hoe::add_include_dirs File.expand_path("~/Work/p4/zss/src/#{project}/dev/lib")
end
Hoe::add_include_dirs 'lib'

require './lib/transmogrify.rb'

Hoe.new('transmogrify', Transmogrify::VERSION) do |p|
  p.rubyforge_name = 'seattlerb'

  p.developer('Ryan Davis', 'ryand-ruby@zenspider.com')
  p.developer('Rein Henrichs', 'reinh@reinh.com')

  p.extra_deps << ['sexp_processor', '>= 3.0.0']
  p.extra_deps << ['ruby_parser',    '>= 1.1.0']
  p.extra_deps << 'ruby2ruby'
end

# TODO: need rules so that transmogrify transforms itself

task :fuck_around do
  sh "cp lib/transmogrify.rb blah.rb"
  ruby "-I/Users/ryan/Work/p4/zss/src/ruby2ruby/dev/lib:/Users/ryan/Work/p4/zss/src/ruby_parser/dev/lib:/Users/ryan/Work/p4/zss/src/sexp_processor/dev/lib:lib:ext:bin:test bin/transmogrify blah.rb"
end

# vim: syntax=Ruby
