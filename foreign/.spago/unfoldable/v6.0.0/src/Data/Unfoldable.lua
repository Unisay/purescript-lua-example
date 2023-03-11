return {
  unfoldrArrayImpl = function(isNothing)
    return function(fromJust)
      return function(fst)
        return function(snd)
          return function(f)
            return function(b)
              local result = {}
              local value = b
              while true do
                local maybe = f(value)
                if isNothing(maybe) then return result end
                local tuple = fromJust(maybe)
                table.insert(result, fst(tuple))
                value = snd(tuple)
              end
            end
          end
        end
      end
    end
  end
}
