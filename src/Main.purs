module Main where

import Prelude

import Effect (Effect)
import Lua.Ngx (say)
import Lua.Ngx.Http.Status as Status

main :: Effect Unit
main = do
  Status.set Status.ok
  say "Hello from \"PureScript/Lua\"!"

