return {
    _new = function(val) return function() return { value = val }; end; end,
    newWithSelf = function(f)
        return function()
            local ref = { value = nil };
            ref.value = f(ref);
            return ref;
        end;
    end,
    modifyImpl = function(f)
        return function(ref)
            return function()
                local t = f(ref.value);
                ref.value = t.state;
                return t.value;
            end;
        end;
    end,
    read = function(ref) return function() return ref.value; end; end,
    write = function(val)
        return function(ref) return function() ref.value = val; end; end;
    end,
}
