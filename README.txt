= transmogrify

* http://github.com/zenspider/transmogrify/tree/master
* http://rubyforge.org/projects/seattlerb

== DESCRIPTION:

Transmogrify unfactors your code, providing you with much needed job
security in today's volatile economy.

== FEATURES/PROBLEMS:

* Transmogrify rewrites your code using Advanced Technology(tm).
  * lvar renaming:
    * numbered sequences
    * pig latin
    * rot13
* transmogrify command line tool transmogrifies and replaces the old code!

== TODO/IDEAS

* loop unrolling
* hash -> array conversion
* misuse of raise/rescue, try/catch
* replace true/false with variants of !!?!
* private method renaming 
* namespacing
* unnamespacing
* renamespacing
* comment removal - this is done via r2r whether we like it or not atm
* comment addition
* project restructuring
  * rakefile obfuscation - convolute the build and running tests etc.
  * ungemification
* randomize method order

== SYNOPSIS:

  % transmogrify lib/blah.rb

== REQUIREMENTS:

* ruby2ruby
* sexp_processor
* ruby_parser

== INSTALL:

* sudo gem install transmogrify

== LICENSE:

(The MIT License)

Copyright (c) 2008 Ryan Davis, Rein Henrichs

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
