module Transmogrifiers
  module Piglatin
    def transmogrify(name)
      name = super.to_s
      append_string = ''

      if match = name.match(/\d+$/)
        name, append_string = match.pre_match, match[0]
      end

      if match = name.match(/^[^aeiou]+/i)
        name = match.post_match + match[0]
      else
        name = name + 'w'
      end

      name = name.downcase.capitalize if name.match(/[A-Z]/)

      :"#{name}ay#{append_string}"
    end
  end
end
