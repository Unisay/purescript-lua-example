return {
    arrayExtend = function(f) return function(xs)
            local result = {}
            for i, _ in ipairs(xs) do
                result[i] = f(table.unpack(xs, i + 1))
            end
            return result
        end;
    end;
}
