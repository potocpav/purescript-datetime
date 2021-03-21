module PureData.Date.Gen
  ( genDate
  , module PureData.Date.Component.Gen
  ) where

import Prelude
import Control.Monad.Gen (class MonadGen, chooseInt)
import PureData.Date (Date, adjust, exactDate, isLeapYear)
import PureData.Date.Component.Gen (genDay, genMonth, genWeekday, genYear)
import Data.Int (toNumber)
import Data.Maybe (fromJust)
import PureData.Time.Duration (Days(..))
import Partial.Unsafe (unsafePartial)

-- | Generates a random `Date` between 1st Jan 1900 and 31st Dec 2100,
-- | inclusive.
genDate :: forall m. MonadGen m => m Date
genDate = do
  year <- genYear
  let maxDays = if isLeapYear year then 365 else 364
  days <- Days <<< toNumber <$> chooseInt 0 maxDays
  pure $ unsafePartial $ fromJust do
    janFirst <- exactDate year bottom bottom
    adjust days janFirst
