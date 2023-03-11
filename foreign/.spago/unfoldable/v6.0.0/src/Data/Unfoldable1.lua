return {
  unfoldr1ArrayImpl = function(isNothing)
    return function(fromJust)
      return function(fst)
        return function(snd)
          return function(f)
            return function(b)
              local result = {}
              local value = b
              while true do
                local tuple = f(value)
                table.insert(result, fst(tuple))
                local maybe = snd(tuple)
                if isNothing(maybe) then return result end
                value = fromJust(maybe)
              end
            end
          end
        end
      end
    end
  end
}
