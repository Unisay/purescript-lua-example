return {
    boolConj = function(b1) return function(b2) return b1 and b2 end end,
    boolDisj = function(b1) return function(b2) return b1 or b2 end end,
    boolNot = function(b) return not b end
}
