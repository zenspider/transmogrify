# -*- ruby -*-

require 'rubygems'
require 'hoe'

%w(sexp_processor ruby_parser ruby2ruby).each do |project|
  Hoe::add_include_dirs File.expand_path("~/Work/p4/zss/src/#{project}/dev/lib")
end

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

# vim: syntax=Ruby
