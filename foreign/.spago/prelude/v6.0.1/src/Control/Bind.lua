return {
    arrayBind = function(arr)
        return function(f)
            local n = 1
            local result = {}
            for i = 1, #arr do
                for _, v in ipairs(f(arr[i])) do
                    result[n] = v
                    n = n + 1
                end
            end
            return result
        end
    end
}
