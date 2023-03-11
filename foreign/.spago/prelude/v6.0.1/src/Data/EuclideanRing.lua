return {
    intDegree = function(x) return math.min(math.abs(x), math.maxinteger) end,
    intDiv = function(x) return function(y)
            if y == 0 then return 0 end
            return y > 0 and math.floor(x / y) or -math.floor(x / -y)
        end
    end,
    intMod = function(x) return function(y)
            if y == 0 then return 0 end
            local yy = math.abs(y)
            return ((x % yy) + yy) % yy
        end
    end,
    numDiv = function(n1) return function(n2) return n1 / n2 end end,
}
