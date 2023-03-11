return {
    arrayApply = function(fs)
        return function(xs)
            local n, l, m, result = 1, #fs, #xs, {}
            for i = 1, l do
                for j = 1, m do
                    result[n] = fs[i](xs[j])
                    n = n + 1
                end
            end
            return result
        end
    end
}
