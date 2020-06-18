module Jekyll
  module RainbowBraces
    def rainbowify(text, wrapDepth = 8)
			depth = 0
			out = ""
			text.each_char do |c|
				case c
				when '(', '{', '['
					out += "<span class=\"brace-depth-#{depth % wrapDepth}\">#{c}</span>"
					depth += 1
				when ')', '}', ']'
					depth -= 1
					out += "<span class=\"brace-depth-#{depth % wrapDepth}\">#{c}</span>"
				else
					out += c
				end
			end
			out
    end
  end
end

Liquid::Template.register_filter(Jekyll::RainbowBraces)