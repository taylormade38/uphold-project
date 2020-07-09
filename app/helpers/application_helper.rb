module ApplicationHelper
    def acronymize(word)
        word.split(" ").map {|w| w[0].upcase }.join("")
    end
end
