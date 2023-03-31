module Main where

import Prelude

import Effect (Effect)
import Lua.Ngx (say)
import Lua.Ngx.Http.Status as Status
import Lua.Ngx.Http.Status (paymentRequired)

main :: Effect Unit
main = do
  Status.set paymentRequired
  say "Hello from \"PureScript/Lua\"!"

