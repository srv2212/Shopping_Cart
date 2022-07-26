class Integer
    def ordinalize
        case self%10
        when 1
            return "#{self}st"
        when 2
            return "#{self}nd"
        when 3
            return "#{self}rd"
        else
            return "#{self}th"
        end
    end
end

