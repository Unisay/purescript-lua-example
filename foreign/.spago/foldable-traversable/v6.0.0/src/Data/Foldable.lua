return {
    foldrArray = function(f)
        return function(init)
            return function(xs)
                local acc = init
                local len = #xs
                for i = len, 1, -1 do
                    acc = f(xs[i])(acc)
                end
                return acc
            end
        end
    end,

    foldlArray = function(f)
        return function(init)
            return function(xs)
                local acc = init
                local len = #xs
                for i = 1, len do
                    acc = f(acc)(xs[i])
                end
                return acc
            end
        end
    end
}
