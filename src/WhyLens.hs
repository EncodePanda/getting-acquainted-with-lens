{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedLabels      #-}
{-# LANGUAGE TypeApplications      #-}
module WhyLens where

import           Data.Function        ((&))
import           GHC.OverloadedLabels (IsLabel (..))

data Conference = Conference
  { name      :: String
  , organizer :: Organizer
  , speakers  :: [Speaker]
  } deriving Show

instance IsLabel "name" (Conference -> String) where
   fromLabel = name

data Organizer = Organizer
  { name    :: Name
  , contact :: Contact
  } deriving Show

instance IsLabel "name" (Organizer -> Name) where
   fromLabel = name

data Name = Name
  { firstName :: String
  , lastName  :: String
  } deriving Show

data Contact = Contact
  { address :: Address
  , email   :: String
  } deriving Show

data Speaker = Speaker
  { name        :: Name
  , slidesReady :: Bool
  } deriving Show

instance IsLabel "name" (Speaker -> Name) where
   fromLabel = name

data Address = Address
  { street  :: String
  , city    :: String
  , country :: String
  } deriving Show

haskellLove :: Conference
haskellLove = Conference
  { organizer = oli
  , speakers = []
  , name = "Haskell.Love"
  }

oli :: Organizer
oli = Organizer
  { name = Name "Oli" "Makhasoeva"
  , contact = classified
  }

classified :: Contact
classified = Contact
  { address = Address "Class" "ified" "Ha!"
  , email = "oli@haskell.love"
  }

organizerCountry :: Conference -> String
organizerCountry conf =
  conf & organizer & contact & address & country

organizerName :: Conference -> Name
organizerName conference =
  conference & organizer & #name

instance IsLabel "encodepanda" Speaker where
  fromLabel = Speaker
    { name = Name "Pawel" "Szulc"
    , slidesReady = False
    }

pawel :: Speaker
pawel = fromLabel @"encodepanda"
