local Prim_I_undefined = nil
local function _S___runtime_lazy(name)
       return function(init)
         return function()
           local state = 0
           local val = nil
           if state == 2 then
             return val
           else
             if state == 1 then
               return error(name .. " was needed before it finished initializing")
             else
               state = 1
               val = init()
               state = 2
               return val
             end
           end
         end
       end
     end
local Effect_I_foreign = {
  pureE = function(a)
      return function()
        return a
      end
    end,
  bindE = function(a)
      return function(f)
        return function()
          return f(a())()
        end
      end
    end,
  untilE = function(f)
      return function()
        while not f() do
        end
      end
    end,
  whileE = function(f)
      return function(a)
        return function()
          while f() do
            a()
          end
        end
      end
    end,
  forE = function(lo)
      return function(hi)
        return function(f)
          return function()
            for i = lo, hi do
              f(i)()
            end
          end
        end
      end
    end,
  foreachE = function(as)
      return function(f)
        return function()
          for i, v in ipairs(as) do
            f(v)()
          end
        end
      end
    end
}
local Lua_Ngx_Http_Status_I_foreign = {
  continue = ngx.HTTP_CONTINUE,
  switchingProtocols = ngx.HTTP_SWITCHING_PROTOCOLS,
  ok = ngx.HTTP_OK,
  created = ngx.HTTP_CREATED,
  accepted = ngx.HTTP_ACCEPTED,
  noContent = ngx.HTTP_NO_CONTENT,
  partialContent = ngx.HTTP_PARTIAL_CONTENT,
  specialResponse = ngx.HTTP_SPECIAL_RESPONSE,
  movedPermanently = ngx.HTTP_MOVED_PERMANENTLY,
  movedTemporarily = ngx.HTTP_MOVED_TEMPORARILY,
  seeOther = ngx.HTTP_SEE_OTHER,
  notModified = ngx.HTTP_NOT_MODIFIED,
  temporaryRedirect = ngx.HTTP_TEMPORARY_REDIRECT,
  permanentRedirect = ngx.HTTP_PERMANENT_REDIRECT,
  badRequest = ngx.HTTP_BAD_REQUEST,
  unauthorized = ngx.HTTP_UNAUTHORIZED,
  paymentRequired = ngx.HTTP_PAYMENT_REQUIRED,
  forbidden = ngx.HTTP_FORBIDDEN,
  notFound = ngx.HTTP_NOT_FOUND,
  notAllowed = ngx.HTTP_NOT_ALLOWED,
  notAcceptable = ngx.HTTP_NOT_ACCEPTABLE,
  requestTimeout = ngx.HTTP_REQUEST_TIMEOUT,
  conflict = ngx.HTTP_CONFLICT,
  gone = ngx.HTTP_GONE,
  upgradeRequired = ngx.HTTP_UPGRADE_REQUIRED,
  tooManyRequests = ngx.HTTP_TOO_MANY_REQUESTS,
  close = ngx.HTTP_CLOSE,
  illegal = ngx.HTTP_ILLEGAL,
  internalServerError = ngx.HTTP_INTERNAL_SERVER_ERROR,
  notImplemented = ngx.HTTP_NOT_IMPLEMENTED,
  methodNotImplemented = ngx.HTTP_METHOD_NOT_IMPLEMENTED,
  badGateway = ngx.HTTP_BAD_GATEWAY,
  serviceUnavailable = ngx.HTTP_SERVICE_UNAVAILABLE,
  gatewayTimeout = ngx.HTTP_GATEWAY_TIMEOUT,
  versionNotSupported = ngx.HTTP_VERSION_NOT_SUPPORTED,
  insufficientStorage = ngx.HTTP_INSUFFICIENT_STORAGE,
  get = function() return ngx.status end,
  set = function(status) return function() ngx.status = status end end
}
local Control_Applicative_I_pure = function(dict) return dict.pure end
local Control_Bind_I_bind = function(dict) return dict.bind end
local Effect_I_monadEffect
local Effect_I_bindEffect
local Effect_I_applicativeEffect
local Effect_I__S___lazy_functorEffect
local Effect_I__S___lazy_applyEffect
Effect_I_monadEffect = {
  Applicative0 = function(unused0) return Effect_I_applicativeEffect end,
  Bind1 = function(unused1) return Effect_I_bindEffect end
}
Effect_I_bindEffect = {
  bind = Effect_I_foreign.bindE,
  Apply0 = function(unused2) return Effect_I__S___lazy_applyEffect(0) end
}
Effect_I_applicativeEffect = {
  pure = Effect_I_foreign.pureE,
  Apply0 = function(unused3) return Effect_I__S___lazy_applyEffect(0) end
}
Effect_I__S___lazy_functorEffect = _S___runtime_lazy("functorEffect")(function( unused4 )
  return {
    map = (function(dictApplicative)
      return function(f)
        return (function(dict)
          return dict.apply
        end)(dictApplicative.Apply0(Prim_I_undefined))(Control_Applicative_I_pure(dictApplicative)(f))
      end
    end)(Effect_I_applicativeEffect)
  }
end)
Effect_I__S___lazy_applyEffect = _S___runtime_lazy("applyEffect")(function( unused6 )
  return {
    apply = (function(dictMonad)
      return function(f)
        local bind = Control_Bind_I_bind(dictMonad.Bind1(Prim_I_undefined))
        return function(a)
          return bind(f)(function(fPrime)
            return bind(a)(function(aPrime)
              return Control_Applicative_I_pure(dictMonad.Applicative0(Prim_I_undefined))(fPrime(aPrime))
            end)
          end)
        end
      end
    end)(Effect_I_monadEffect),
    Functor0 = function(unused5) return Effect_I__S___lazy_functorEffect(0) end
  }
end)
return (function(dict) return dict.discard end)({
  discard = Control_Bind_I_bind
})(Effect_I_bindEffect)(Lua_Ngx_Http_Status_I_foreign.set(Lua_Ngx_Http_Status_I_foreign.ok))(function( unused7 )
  return (function(msg) return function() ngx.say(msg) end end)("Hello from \"PureScript/Lua\"!")
end)()