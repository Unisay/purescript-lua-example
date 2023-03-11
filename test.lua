local function dump(t)
  for k, v in pairs(t) do
    print(k, v)
  end
end

local Array = assert(loadfile("foreign/.spago/arrays/v7.2.0/src/Data/Array.lua"))()

local xs = { "A", "B", "C", "X", "Y", "Z" }
local ys = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
local f = function(x)
  if (x > 10)
  then return true
  else return false
  end
end

print(Array.any(f)(ys))
