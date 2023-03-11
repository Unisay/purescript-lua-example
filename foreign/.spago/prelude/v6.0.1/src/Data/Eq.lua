local refEq = function(r1) return function(r2) return r1 == r2 end end
return {
    refEq = refEq,
    eqBooleanImpl = refEq,
    eqIntImpl = refEq,
    eqNumberImpl = refEq,
    eqCharImpl = refEq,
    eqStringImpl = refEq,
    eqArrayImpl = function(f) return function(xs) return function(ys)
                local l = #xs
                if l ~= #ys then return false end
                for i = 1, l do
                    if not f(xs[i])(ys[i]) then return false end
                end
                return true
            end
        end
    end
}
