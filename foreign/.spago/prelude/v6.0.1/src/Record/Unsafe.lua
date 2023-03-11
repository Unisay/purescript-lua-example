return {
    unsafeHas = function(l) return function(r) return r[l] ~= nil end end,
    unsafeGet = function(l) return function(r) return r[l] end end,
    unsafeSet = function(l) return function(value) return function(r)
                local copy = {}
                for key, val in pairs(r) do
                    copy[key] = val
                end
                copy[l] = value
                return copy
            end
        end
    end,
    unsafeDelete = function(l) return function(r)
            local copy = {}
            for key, val in pairs(r) do if key ~= l then copy[key] = val end end
            return copy
        end
    end
}
