local _S___runtime_lazy = function(name)
  return function(init)
    local state = 0
    local val = nil
    return function(lineNumber)
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
local Prim_I_undefined = nil
local Control_Apply_I_apply = function(dict0)
  local v1 = dict0
  return v1.apply
end
local Control_Applicative_I_pure = function(dict0)
  local v1 = dict0
  return v1.pure
end
local Control_Applicative_I_liftA1 = function(dictApplicative2)
  return function(f5)
    local apply3 = Control_Apply_I_apply(dictApplicative2.Apply0(Prim_I_undefined))
    local pure14 = Control_Applicative_I_pure(dictApplicative2)
    return function(a6) return apply3(pure14(f5))(a6) end
  end
end
local Control_Bind_I_discard = function(dict0)
  local v1 = dict0
  return v1.discard
end
local Control_Bind_I_bind = function(dict2) local v3 = dict2 return v3.bind end
local Control_Bind_I_discardUnit = {
  discard = function(dictBind4) return Control_Bind_I_bind(dictBind4) end
}
local Control_Monad_I_ap = function(dictMonad0)
  return function(f3)
    local bind1 = Control_Bind_I_bind(dictMonad0.Bind1(Prim_I_undefined))
    local pure2 = Control_Applicative_I_pure(dictMonad0.Applicative0(Prim_I_undefined))
    return function(a4)
      return bind1(f3)(function(fPrime5)
        return bind1(a4)(function(aPrime6) return pure2(fPrime5(aPrime6)) end)
      end)
    end
  end
end
local Effect_I_foreign = (function()
  return {

    pureE = function(a)
      return function()
        return a
      end
    end

    , bindE = function(a)
      return function(f)
        return function()
          return f(a())()
        end
      end
    end

    , untilE = function(f)
      return function()
        while not f() do end
      end
    end

    , whileE = function(f)
      return function(a)
        return function()
          while f() do
            a()
          end
        end
      end
    end

    , forE = function(lo)
      return function(hi)
        return function(f)
          return function()
            for i = lo, hi do
              f(i)()
            end
          end
        end
      end
    end

    , foreachE = function(as)
      return function(f)
        return function()
          for i, v in ipairs(as) do
            f(v)()
          end
        end
      end
    end

  }
end)()
local Effect_I_pureE = Effect_I_foreign.pureE
local Effect_I_bindE = Effect_I_foreign.bindE
local Effect_I_monadEffect
local Effect_I_bindEffect
local Effect_I_applicativeEffect
local Effect_I__S___lazy_functorEffect
local Effect_I__S___lazy_applyEffect
Effect_I_monadEffect = {
  Applicative0 = function() return Effect_I_applicativeEffect end,
  Bind1 = function() return Effect_I_bindEffect end
}
Effect_I_bindEffect = {
  bind = Effect_I_bindE,
  Apply0 = function() return Effect_I__S___lazy_applyEffect(0) end
}
Effect_I_applicativeEffect = {
  pure = Effect_I_pureE,
  Apply0 = function() return Effect_I__S___lazy_applyEffect(0) end
}
Effect_I__S___lazy_functorEffect = _S___runtime_lazy("functorEffect")(function()
  return { map = Control_Applicative_I_liftA1(Effect_I_applicativeEffect) }
end)
Effect_I__S___lazy_applyEffect = _S___runtime_lazy("applyEffect")(function()
  return {
    apply = Control_Monad_I_ap(Effect_I_monadEffect),
    Functor0 = function() return Effect_I__S___lazy_functorEffect(0) end
  }
end)
local Lua_Ngx_I_foreign = (function()
  return { say = function(msg) return function() ngx.say(msg) end end }
end)()
local Lua_Ngx_I_say = Lua_Ngx_I_foreign.say
local Lua_Ngx_Http_Status_I_foreign = (function()
  return {
      continue = ngx.HTTP_CONTINUE
      , switchingProtocols = ngx.HTTP_SWITCHING_PROTOCOLS
      , ok = ngx.HTTP_OK
      , created = ngx.HTTP_CREATED
      , accepted = ngx.HTTP_ACCEPTED
      , noContent = ngx.HTTP_NO_CONTENT
      , partialContent = ngx.HTTP_PARTIAL_CONTENT
      , specialResponse = ngx.HTTP_SPECIAL_RESPONSE
      , movedPermanently = ngx.HTTP_MOVED_PERMANENTLY
      , movedTemporarily = ngx.HTTP_MOVED_TEMPORARILY
      , seeOther = ngx.HTTP_SEE_OTHER
      , notModified = ngx.HTTP_NOT_MODIFIED
      , temporaryRedirect = ngx.HTTP_TEMPORARY_REDIRECT
      , permanentRedirect = ngx.HTTP_PERMANENT_REDIRECT
      , badRequest = ngx.HTTP_BAD_REQUEST
      , unauthorized = ngx.HTTP_UNAUTHORIZED
      , paymentRequired = ngx.HTTP_PAYMENT_REQUIRED
      , forbidden = ngx.HTTP_FORBIDDEN
      , notFound = ngx.HTTP_NOT_FOUND
      , notAllowed = ngx.HTTP_NOT_ALLOWED
      , notAcceptable = ngx.HTTP_NOT_ACCEPTABLE
      , requestTimeout = ngx.HTTP_REQUEST_TIMEOUT
      , conflict = ngx.HTTP_CONFLICT
      , gone = ngx.HTTP_GONE
      , upgradeRequired = ngx.HTTP_UPGRADE_REQUIRED
      , tooManyRequests = ngx.HTTP_TOO_MANY_REQUESTS
      , close = ngx.HTTP_CLOSE
      , illegal = ngx.HTTP_ILLEGAL
      , internalServerError = ngx.HTTP_INTERNAL_SERVER_ERROR
      , notImplemented = ngx.HTTP_NOT_IMPLEMENTED
      , methodNotImplemented = ngx.HTTP_METHOD_NOT_IMPLEMENTED
      , badGateway = ngx.HTTP_BAD_GATEWAY
      , serviceUnavailable = ngx.HTTP_SERVICE_UNAVAILABLE
      , gatewayTimeout = ngx.HTTP_GATEWAY_TIMEOUT
      , versionNotSupported = ngx.HTTP_VERSION_NOT_SUPPORTED
      , insufficientStorage = ngx.HTTP_INSUFFICIENT_STORAGE
      , get = function() return ngx.status end
      , set = function(status) return function() ngx.status = status end end
  }
end)()
local Lua_Ngx_Http_Status_I_paymentRequired = Lua_Ngx_Http_Status_I_foreign.paymentRequired
local Lua_Ngx_Http_Status_I_set = Lua_Ngx_Http_Status_I_foreign.set
local Main_I_main = Control_Bind_I_discard(Control_Bind_I_discardUnit)(Effect_I_bindEffect)(Lua_Ngx_Http_Status_I_set(Lua_Ngx_Http_Status_I_paymentRequired))(function(  )
  return Lua_Ngx_I_say("Hello from \"PureScript/Lua\"!")
end)
return Main_I_main()