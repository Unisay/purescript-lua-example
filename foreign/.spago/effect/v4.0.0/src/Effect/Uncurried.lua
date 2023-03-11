return {
  mkEffectFn1 = function(fn)
    return function(a)
      return fn(a)()
    end
  end

  , mkEffectFn2 = function(fn)
    return function(a, b)
      return fn(a)(b)()
    end
  end

  , mkEffectFn3 = function(fn)
    return function(a, b, c)
      return fn(a)(b)(c)()
    end
  end


  , mkEffectFn4 = function(fn)
    return function(a, b, c, d)
      return fn(a)(b)(c)(d)()
    end
  end

  , mkEffectFn5 = function(fn)
    return function(a, b, c, d, e)
      return fn(a)(b)(c)(d)(e)()
    end
  end

  , mkEffectFn6 = function(fn)
    return function(a, b, c, d, e, f)
      return fn(a)(b)(c)(d)(e)(f)()
    end
  end

  , mkEffectFn7 = function(fn)
    return function(a, b, c, d, e, f, g)
      return fn(a)(b)(c)(d)(e)(f)(g)()
    end
  end

  , mkEffectFn8 = function(fn)
    return function(a, b, c, d, e, f, g, h)
      return fn(a)(b)(c)(d)(e)(f)(g)(h)()
    end
  end

  , mkEffectFn9 = function(fn)
    return function(a, b, c, d, e, f, g, h, i)
      return fn(a)(b)(c)(d)(e)(f)(g)(h)(i)()
    end
  end

  , mkEffectFn10 = function(fn)
    return function(a, b, c, d, e, f, g, h, i, j)
      return fn(a)(b)(c)(d)(e)(f)(g)(h)(i)(j)()
    end
  end

  , runEffectFn1 = function(fn)
    return function(a)
      return function()
        return fn(a)
      end
    end
  end

  , runEffectFn2 = function(fn)
    return function(a)
      return function(b)
        return function()
          return fn(a, b)
        end
      end
    end
  end

  , runEffectFn3 = function(fn)
    return function(a)
      return function(b)
        return function(c)
          return function()
            return fn(a, b, c)
          end
        end
      end
    end
  end

  , runEffectFn4 = function(fn)
    return function(a)
      return function(b)
        return function(c)
          return function(d)
            return function()
              return fn(a, b, c, d)
            end
          end
        end
      end
    end
  end

  , runEffectFn5 = function(fn)
    return function(a)
      return function(b)
        return function(c)
          return function(d)
            return function(e)
              return function()
                return fn(a, b, c, d, e)
              end
            end
          end
        end
      end
    end
  end

  , runEffectFn6 = function(fn)
    return function(a)
      return function(b)
        return function(c)
          return function(d)
            return function(e)
              return function(f)
                return function()
                  return fn(a, b, c, d, e, f)
                end
              end
            end
          end
        end
      end
    end
  end

  , runEffectFn7 = function(fn)
    return function(a)
      return function(b)
        return function(c)
          return function(d)
            return function(e)
              return function(f)
                return function(g)
                  return function()
                    return fn(a, b, c, d, e, f, g)
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  , runEffectFn8 = function(fn)
    return function(a)
      return function(b)
        return function(c)
          return function(d)
            return function(e)
              return function(f)
                return function(g)
                  return function(h)
                    return function()
                      return fn(a, b, c, d, e, f, g, h)
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  , runEffectFn9 = function(fn)
    return function(a)
      return function(b)
        return function(c)
          return function(d)
            return function(e)
              return function(f)
                return function(g)
                  return function(h)
                    return function(i)
                      return function()
                        return fn(a, b, c, d, e, f, g, h, i)
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  , runEffectFn10 = function(fn)
    return function(a)
      return function(b)
        return function(c)
          return function(d)
            return function(e)
              return function(f)
                return function(g)
                  return function(h)
                    return function(i)
                      return function(j)
                        return function()
                          return fn(a, b, c, d, e, f, g, h, i)
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
}
