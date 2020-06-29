module Jekyll
  module RainbowBraces
		def rainbowify(text, wrapDepth = 8)
			#Maintain a stack of depths so that quotations (inc. string literals)
			#inherit from but do not contribute to the brace depths of their surroundings.
			#This way unclosed braces in quotations don't leak outside their quotes.
			depths = [0]
			out = ""
			lastChar = nil
			text.each_char do |c|
				case c
				when /["'“”‘’]/
					if lastChar =~ /\s/ #beginning a quotation
						depths.push(depths[-1])
					end
					out += c
				when /\s/
					if lastChar =~ /["'“”‘’]/ && depths.length > 1 #ending a quotation
						depths.pop()
					end
					out += c
				when '(', '{', '['
					out += "<span class=\"brace-depth-#{depths[-1] % wrapDepth}\">#{c}</span>"
					depths[-1] += 1
				when ')', '}', ']'
					depths[-1] -= 1
					out += "<span class=\"brace-depth-#{depths[-1] % wrapDepth}\">#{c}</span>"
				else
					out += c
				end
				lastChar = c
			end
			out
    end
  end
end

Liquid::Template.register_filter(Jekyll::RainbowBraces)
