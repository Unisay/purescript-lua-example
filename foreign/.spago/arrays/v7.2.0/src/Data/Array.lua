return {
  range = function(start)
    return function(end_)
      local step = start > end_ and -1 or 1
      local result = {}
      local i, n = start, 1
      while i ~= end_ do
        result[n] = i
        n = n + 1
        i = i + step
      end
      result[n] = i
      return result
    end
  end,

  replicate = function(count)
    return function(value)
      if count < 1 then
        return {}
      end
      local result = {}
      for i = 1, count do
        result[i] = value
      end
      return result
    end
  end,

  fromFoldableImpl = (function()
    local function Cons(head, tail) return { head = head, tail = tail } end

    local emptyList = {}

    local function curryCons(head)
      return function(tail) return Cons(head, tail) end
    end

    local function listToArray(list)
      local result = {}
      local count = 1
      local xs = list
      while xs ~= emptyList do
        result[count] = xs.head
        count = count + 1
        xs = xs.tail
      end
      return result
    end

    return function(foldr)
      return function(xs)
        return listToArray(foldr(curryCons)(emptyList)(xs))
      end
    end
  end)(),

  length = function(xs) return #xs end,

  unconsImpl = function(empty)
    return function(next)
      return function(xs)
        if #xs == 0 then return empty({}) end
        return next(xs[1])(table.pack(table.unpack(xs, 2)))
      end
    end
  end,

  indexImpl = function(just)
    return function(nothing)
      return function(xs)
        return function(i)
          if i < 0 or i >= #xs
          then return nothing
          else return just(xs[i + 1])
          end
        end
      end
    end
  end,

  findMapImpl = function(nothing)
    return function(isJust)
      return function(f)
        return function(xs)
          for i = 1, #xs do
            local result = f(xs[i])
            if isJust(result) then return result end
          end
          return nothing
        end
      end
    end
  end,

  findIndexImpl = function(just)
    return function(nothing)
      return function(f)
        return function(xs)
          for i = 1, #xs do
            if f(xs[i]) then return just(i - 1) end
          end
          return nothing
        end
      end
    end
  end,

  findLastIndexImpl = function(just)
    return function(nothing)
      return function(f)
        return function(xs)
          for i = #xs, 1, -1 do
            if f(xs[i]) then return just(i - 1) end
          end
          return nothing
        end
      end
    end
  end,

  _insertAt = function(just)
    return function(nothing)
      return function(i)
        return function(a)
          return function(l)
            if i < 0 or i > #l then return nothing end
            local l1 = table.pack(table.unpack(l))
            table.insert(l1, i + 1, a)
            return just(l1)
          end
        end
      end
    end
  end,

  _deleteAt = function(just)
    return function(nothing)
      return function(i)
        return function(l)
          if i < 0 or i >= #l then return nothing end
          local l1 = table.pack(table.unpack(l))
          table.remove(l1, i + 1)
          return just(l1)
        end
      end
    end
  end,

  _updateAt = function(just)
    return function(nothing)
      return function(i)
        return function(f)
          return function(l)
            if i < 0 or i >= #l then return nothing end
            local l1 = table.pack(table.unpack(l))
            l1[i + 1] = f(l1[i + 1])
            return just(l1)
          end
        end
      end
    end
  end,

  reverse = function(xs)
    local result, l = {}, #xs
    for i = l, 1, -1 do result[l - i + 1] = xs[i] end
    return result
  end,

  concat = function(xss)
    local result = {}
    local l = 1
    for i = 1, #xss do
      local xs = xss[i]
      for j = 1, #xs do
        result[l] = xs[j]
        l = l + 1
      end
    end
    return result
  end,

  filter = function(f)
    return function(xs)
      local result = {}
      local l = 1
      for i = 1, #xs do
        local x = xs[i]
        if f(x) then
          result[l] = x
          l = l + 1
        end
      end
      return result
    end
  end,

  partition = function(f)
    return function(xs)
      local yes, no = {}, {}
      local l1, l2 = 1, 1
      for i = 1, #xs do
        local x = xs[i]
        if f(x) then
          yes[l1] = x
          l1 = l1 + 1
        else
          no[l2] = x
          l2 = l2 + 1
        end
      end
      return { yes = yes, no = no }
    end
  end,

  scanl = function(f)
    return function(b)
      return function(xs)
        local result = {}
        local acc = b
        for i = 1, #xs do
          acc = f(acc)(xs[i])
          result[i] = acc
        end
        return result
      end
    end
  end,

  scanr = function(f)
    return function(b)
      return function(xs)
        local result = {}
        local acc = b
        for i = #xs, 1, -1 do
          acc = f(xs[i])(acc)
          result[i] = acc
        end
        return result
      end
    end
  end,

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
          if #xs < 2 then return xs end
          local out = table.pack(table.unpack(xs))
          local slice = table.pack(table.unpack(xs))
          mergeFromTo(compare, fromOrdering, out, slice, 0, #xs)
          return out
        end
      end
    end

  end)(),

  slice = function(s)
    return function(e)
      return function(t)
        local spliced = {}
        for i, el in ipairs(t) do
          if i > s and i <= e then table.insert(spliced, el) end
        end
        return spliced
      end
    end
  end,

  zipWith = function(f)
    return function(xs)
      return function(ys)
        local l = #xs < #ys and #xs or #ys
        local result = {}
        for i = 1, l do
          result[i] = f(xs[i])(ys[i])
        end
        return result
      end
    end
  end,

  any = function(p)
    return function(xs)
      for i = 1, #xs do
        if p(xs[i]) then return true end
      end
      return false
    end
  end,

  all = function(p)
    return function(xs)
      for i = 1, #xs do
        if not p(xs[i]) then return false end
      end
      return true
    end
  end,

  unsafeIndexImpl = function(xs)
    return function(n)
      return xs[n + 1]
    end
  end,
}
