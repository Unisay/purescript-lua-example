return {
    map_ = function(f)
        return function(a)
            return function() return f(a()) end
        end
    end,

    pure_ = function(a)
        return function() return a end
    end,

    bind_ = function(a)
        return function(f)
            return function() return f(a())() end
        end
    end,

    run = function(f) return f() end,

    ["while"] = function(f)
        return function(a)
            return function()
                while f() do a() end
            end
        end
    end,

    ["for"] = function(lo)
        return function(hi)
            return function(f)
                return function()
                    for i = lo, hi do
                        f(i)()
                    end
                end
            end
        end
    end,

    foreach = function(as)
        return function(f)
            return function()
                for i = 1, #as do
                    f(as[i])()
                end
            end
        end
    end,

    new = function(val)
        return function() return { value = val } end
    end,

    read = function(ref)
        return function() return ref.value end
    end,

    modifyImpl = function(f)
        return function(ref)
            return function()
                local t = f(ref.value)
                ref.value = t.state
                return t.value
            end
        end
    end,

    write = function(a)
        return function(ref)
            return function()
                ref.value = a
                return a
            end
        end
    end,
}
