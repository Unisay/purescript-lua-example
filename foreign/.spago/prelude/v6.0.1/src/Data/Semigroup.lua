return {
    concatString = function(s1) return function(s2) return s1 .. s2 end end,
    concatArray = function(xs) return function(ys)
            if #xs == 0 then return ys end
            if #ys == 0 then return xs end
            return table.concat(xs, ys)
        end
    end
}
