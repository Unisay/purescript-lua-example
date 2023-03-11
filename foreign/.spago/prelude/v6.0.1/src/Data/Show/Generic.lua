return {
    intercalate =
    function(sep) return function(xs) return table.concat(xs, sep) end end
}
