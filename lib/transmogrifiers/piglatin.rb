module Transmogrifiers
  module Piglatin
    private

    def transmogrify(name)
      name = name.to_s
      if match = name.match(/^[^aeiou]+/)
        name = match.post_match + match[0]
      else
        name = name + 'w'
      end

      :"#{name}ay"
    end
  end

end
