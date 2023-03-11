return {

  foldr1Impl = function(f)
    return function(xs)
      local acc = xs[#xs]
      for i = #xs - 1, 1, -1 do
        acc = f(xs[i])(acc)
      end
      return acc
    end
  end,

  foldl1Impl = function(f)
    return function(xs)
      local acc = xs[1]
      for i = 2, #xs do
        acc = f(acc)(xs[i])
      end
      return acc
    end
  end,

  traverse1Impl = (function()
    local function Cont(this, fn)
      this.fn = fn
    end

    local emptyList = {}

    local function ConsCell(this, head, tail)
      this.head = head
      this.tail = tail
    end

    local function finalCell(head)
      return ConsCell(head, emptyList)
    end

    local function consList(x)
      return function(xs) return ConsCell(x, xs) end
    end

    local function listToArray(list)
      local arr = {}
      local xs = list
      while xs ~= emptyList do
        table.insert(arr, xs.head)
        xs = xs.tail
      end
      return arr
    end

    return function(apply)
      return function(map)
        return function(f)
          local function buildFrom(x, ys)
            return apply(map(consList)(f(x)))(ys)
          end

          local function go(acc, currentLen, xs)
            if currentLen == 0 then
              return acc
            else
              local last = xs[currentLen]
              return Cont(function()
                return go(buildFrom(last, acc), currentLen - 1, xs)
              end)
            end
          end

          return function(array)
            local acc = map(finalCell)(f(array[#array]))
            local result = go(acc, #array - 1, array)
            while result.fn do result = result.fn() end
            return map(listToArray)(result)
          end
        end
      end
    end
  end)()

}
