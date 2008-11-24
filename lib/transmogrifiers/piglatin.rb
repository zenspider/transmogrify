module Transmogrifiers
  module Piglatin
    def transmogrify(name)
      name = name.to_s
      if match = name.match(/^[^aeiou]+/i)
        name = match.post_match + match[0]
      else
        name = name + 'w'
      end

      name = name.downcase.capitalize if name.match(/[A-Z]/)

      :"#{name}ay"
    end
  end
end
