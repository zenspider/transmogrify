module Transmogrifiers
  module Rot13
    def transmogrify(name)
      name.to_s.tr('a-mn-z', 'n-za-m').to_sym
    end
  end
end
