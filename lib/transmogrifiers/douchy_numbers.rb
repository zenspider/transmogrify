module Transmogrifiers
  module DouchyNumbers
    private

    def transmogrify(name)
      @count ||= 0
      @count += 1
      :"douche#{'%02d' % @count}"
    end
  end
end
