module Transmogrifiers
  module DouchyNumbers

  def new_lvar(name)
    @lvar_count ||= 0
    @lvar_count += 1
    :"douche#{'%02d' % @lvar_count}"
  end
  end
end
