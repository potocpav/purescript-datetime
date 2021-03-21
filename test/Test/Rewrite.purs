module Test.Rewrite where

import Prelude
import Test.QuickCheck
import Effect (Effect)
import Effect.Console (log)


main :: Effect Unit
main = do
  log "unimplemented"
  quickCheck \n -> n + 1 == 1 + n