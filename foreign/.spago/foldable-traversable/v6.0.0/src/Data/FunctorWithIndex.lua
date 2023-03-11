return {
    mapWithIndexArray = function(f)
        return function(xs)
            local l = #xs
            local result = {}
            for i = 1, l do
                result[i] = f(i)(xs[i])
            end
            return result
        end
    end
}
