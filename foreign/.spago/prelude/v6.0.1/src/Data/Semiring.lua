return {
    intAdd = function(x) return function(y) return x + y | 0 end end,
    intMul = function(x) return function(y) return x * y | 0 end end,
    numAdd = function(x) return function(y) return x + y end end,
    numMul = function(x) return function(y) return x * y end end,
}
