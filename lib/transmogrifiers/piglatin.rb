module Transmogrifiers
  module Piglatin
    def new_lvar(name)
      pig_latinize(name)
    end

    private

    def pig_latinize(name)
      name = name.to_s
      if match = name.match(/^[^aeiou]+/)
        name = match.post_match + match[0]
      else
        name = name + 'w'
      end

      name += 'ay'
      name.intern
    end
  end

end
