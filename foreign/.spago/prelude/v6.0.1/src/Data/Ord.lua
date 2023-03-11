local unsafeCoerceImpl = function(lt)
    return function(eq)
        return function(gt)
            return function(x)
                return function(y)
                    if x < y then
                        return lt
                    elseif x == y then
                        return eq
                    else
                        return gt
                    end
                end
            end
        end
    end
end

return {
    ordBooleanImpl = unsafeCoerceImpl,
    ordIntImpl = unsafeCoerceImpl,
    ordNumberImpl = unsafeCoerceImpl,
    ordStringImpl = unsafeCoerceImpl,
    ordCharImpl = unsafeCoerceImpl,
    ordArrayImpl = function(f)
        return function(xs)
            return function(ys)
                local i = 1
                local xlen = #xs
                local ylen = #ys
                while i <= xlen and i <= ylen do
                    local x = xs[i]
                    local y = ys[i]
                    local o = f(x)(y)
                    if o ~= 0 then
                        return o
                    end
                    i = i + 1
                end
                if xlen == ylen then
                    return 0
                elseif xlen > ylen then
                    return -1
                else
                    return 1
                end
            end
        end
    end
}
