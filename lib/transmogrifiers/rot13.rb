module Transmogrifiers
  module Rot13
    def transmogrify(name)
      name.to_s.tr('a-mn-zA-MN-Z', 'n-za-mN-ZA-M').to_sym
    end
  end
end
