module PureData.DateTime.Gen
  ( genDateTime
  , module PureData.Date.Gen
  , module PureData.Time.Gen
  ) where

import Prelude
import Control.Monad.Gen (class MonadGen)
import PureData.Date.Gen (genDate, genDay, genMonth, genWeekday, genYear)
import PureData.DateTime (DateTime(..))
import PureData.Time.Gen (genHour, genMillisecond, genMinute, genSecond, genTime)

-- | Generates a random `DateTime` between 1st Jan 1900 00:00:00 and
-- | 31st Dec 2100 23:59:59, inclusive.
genDateTime :: forall m. MonadGen m => m DateTime
genDateTime = DateTime <$> genDate <*> genTime
