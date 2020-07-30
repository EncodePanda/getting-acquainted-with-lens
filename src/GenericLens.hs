module GenericLens where

import           Control.Lens
import           Data.Generics.Labels
import           Data.Generics.Product.Fields
import           Example
import           GHC.Generics
import           GHC.OverloadedLabels         (IsLabel (..))

temp :: Conference -> String
temp conference =
  conference ^. #organizer . #contact . #email

first :: Lens (a, c) (b, c) a b
first = lens getter setter
  where
    getter (a, _) = a
    setter (_, b) c = (c, b)

data Truck a = Truck
 { name  :: String
 , cargo :: a
 } deriving (Show, Generic)

data Fruit = Apple | Orange deriving Show
data Electronic = Computer | Phone deriving Show


someText :: String
someText =  "this is first line\n"
         <> "this is second line"
