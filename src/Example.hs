{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedLabels      #-}
{-# LANGUAGE TypeApplications      #-}
module Example where

import           GHC.OverloadedLabels (IsLabel (..))

data Conference = Conference
  { name      :: String
  , organizer :: Organizer
  , speakers  :: [Speaker]
  } deriving Show

data Organizer = Organizer
  { name    :: Name
  , contact :: Contact
  } deriving Show

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

data Address = Address
  { street  :: String
  , city    :: String
  , country :: String
  } deriving Show

haskellLove :: Conference
haskellLove = Conference
  { organizer = oli
  , speakers = [ pawel
               , marcin
               ]
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

pawel :: Speaker
pawel = fromLabel @"encodepanda"

marcin :: Speaker
marcin = Speaker
  { name = Name "Marcin" "Rzeznicki"
  , slidesReady = True
  }

instance IsLabel "encodepanda" Speaker where
  fromLabel = Speaker
    { name = Name "Pawel" "Szulc"
    , slidesReady = False
    }
