module Main where

import Prelude

import Data.Foldable (for_)
import Effect (Effect)
import Effect.Console (logShow)
import Data.Array ((..))

main :: Effect Unit
main = do
  logShow $ 2 + 3 * 4
  logShow $ noStackOverflow 100_000_000
  for_ (0 .. 10) \n -> do
    logShow $ fact n

fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n - 1)

noStackOverflow :: Int -> Int
noStackOverflow 0 = 42
noStackOverflow i = noStackOverflow (i - 1)
