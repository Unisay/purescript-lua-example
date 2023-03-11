return {
    intSub = function(x) return function(y) return x - y | 0 end end,
    numSub = function(x) return function(y) return x - y end end
}
