return {
    arrayMap = function(f) return function(arr)
            local l = #arr
            local result = {}
            for i = 1, l do result[i] = f(arr[i]) end
            return result
        end
    end
}
