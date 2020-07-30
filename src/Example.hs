module Example where

import           GHC.Generics
import           GHC.OverloadedLabels (IsLabel (..))

data Conference = Conference
  { name      :: String
  , organizer :: Organizer
  , speakers  :: [Speaker]
  } deriving (Generic, Show)

data Organizer = Organizer
  { name    :: Name
  , contact :: Contact
  } deriving (Generic, Show)

data Name = Name
  { firstName :: String
  , lastName  :: String
  } deriving (Generic, Show)

data Contact = Contact
  { address :: Address
  , email   :: String
  } deriving (Generic, Show)

data Speaker = Speaker
  { name        :: Name
  , slidesReady :: Bool
  } deriving (Generic, Show)

data Address = Address
  { street  :: String
  , city    :: String
  , country :: String
  } deriving (Generic, Show)

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
  { address = Address "Class" "ified" "Classified"
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
