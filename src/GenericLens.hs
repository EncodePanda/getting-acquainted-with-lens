module GenericLens where

import           Control.Lens
import           Data.Generics.Labels
import           Data.Generics.Product.Fields
import           Example
import           GHC.OverloadedLabels         (IsLabel (..))

temp :: Conference -> String
temp conference =
  conference ^. #organizer . #contact . #email
