local array1 = function(a)
  return { a }
end

local array2 = function(a)
  return function(b)
    return { a, b }
  end
end

local array3 = function(a)
  return function(b)
    return function(c)
      return { a, b, c }
    end
  end
end

local concat2 = function(xs)
  return function(ys)
    return table.concat(xs, ys)
  end
end

return {
  traverseArrayImpl = function(apply)
    return function(map)
      return function(pure)
        return function(f)
          return function(array)
            local function go(bot, top)
              if top - bot == 0 then
                return pure({})
              elseif top - bot == 1 then
                return map(array1)(f(array[bot]))
              elseif top - bot == 2 then
                return apply(map(array2)(f(array[bot])))(f(array[bot + 1]))
              elseif top - bot == 3 then
                return apply(apply(map(array3)(f(array[bot])))(f(array[bot + 1])))(f(array[bot + 2]))
              else
                -- This slightly tricky pivot selection aims to produce two
                -- even-length partitions where possible.
                local pivot = bot + math.floor((top - bot) / 4) * 2
                return apply(map(concat2)(go(bot, pivot)))(go(pivot, top))
              end
            end

            return go(0, #array)
          end
        end
      end
    end
  end
}
