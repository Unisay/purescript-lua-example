local function copyImpl(xs)
  return function() return table.move(xs, 1, #xs, 1, {}) end
end

return {
  new = function() return {} end,

  peekImpl = function(just)
    return function(nothing)
      return function(i)
        return function(xs)
          return function()
            if i >= 0 and i < #xs then
              return just(xs[i + 1])
            else
              return nothing
            end
          end
        end
      end
    end
  end,

  poke = function(i)
    return function(a)
      return function(xs)
        return function()
          local ret = i >= 0 and i < #xs
          if ret then xs[i + 1] = a end
          return ret
        end
      end
    end
  end,

  length = function(xs) return function() return #xs end end,

  popImpl = function(just)
    return function(nothing)
      return function(xs)
        return function()
          if #xs > 0 then
            return just(table.remove(xs))
          else
            return nothing
          end
        end
      end
    end
  end,

  pushAll = function(as)
    return function(xs)
      return function()
        local r = table.move(as, 1, #as, #xs + 1, xs)
        return #r
      end
    end
  end,

  shiftImpl = function(just)
    return function(nothing)
      return function(xs)
        return function()
          if #xs > 0 then
            return just(table.remove(xs, 1))
          else
            return nothing
          end
        end
      end
    end
  end,

  unshiftAll = function(as)
    return function(xs)
      return function()
        local r = table.move(as, 1, #as, 1, xs)
        return #r
      end
    end
  end,

  splice = function(i)
    return function(howMany)
      return function(bs)
        return function(xs)
          return function()
            return table.move(xs, i + howMany + 1, #xs, i + #bs + 1, xs)
          end
        end
      end
    end
  end,

  unsafeFreeze = function(xs) return function() return xs end end,

  unsafeThaw = function(xs) return function() return xs end end,

  freeze = copyImpl,

  thaw = copyImpl,

  sortByImpl = (function()
    local function rshift(x, by)
      return math.floor(x / 2 ^ by)
    end

    local function mergeFromTo(compare, fromOrdering, xs1, xs2, from, to)
      local mid, i, j, k, x, y, c

      mid = from + rshift(to - from, 1)
      if mid - from > 1 then
        mergeFromTo(compare, fromOrdering, xs2, xs1, from, mid)
      end
      if to - mid > 1 then
        mergeFromTo(compare, fromOrdering, xs2, xs1, mid, to)
      end

      i = from
      j = mid
      k = from
      while i < mid and j < to do
        x = xs2[i + 1]
        y = xs2[j + 1]
        c = fromOrdering(compare(x)(y))
        if c > 0 then
          xs1[k + 1] = y
          j = j + 1
        else
          xs1[k + 1] = x
          i = i + 1
        end
        k = k + 1
      end
      while i < mid do
        xs1[k + 1] = xs2[i + 1]
        i = i + 1
        k = k + 1
      end
      while j < to do
        xs1[k + 1] = xs2[j + 1]
        j = j + 1
        k = k + 1
      end
    end

    return function(compare)
      return function(fromOrdering)
        return function(xs)
          return function()
            if #xs < 2 then return xs end
            mergeFromTo(
              compare,
              fromOrdering,
              xs,
              table.move(xs, 1, #xs, 1, {}), 0, #xs
            )
            return xs
          end
        end
      end
    end
  end)(),

  toAssocArray = function(xs)
    return function()
      local r = {}
      for i = 1, #xs do
        r[i] = { index = i - 1, value = xs[i] }
      end
      return r
    end
  end,

}
