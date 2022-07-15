def prefix(ary, obj)
    result = []
    ary.each do |item|
        result << item
        if item == obj
            return result
        end
    end
    return result
end

p prefix([5,6,7,8,9,10,11], 8)