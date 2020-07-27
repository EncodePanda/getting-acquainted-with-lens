module WhyLens where

import           Data.Function ((&))

data Conference = Conference
  { organizer :: Organizer
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
  { slidesReady :: Bool
  } deriving Show

data Address = Address
  { street  :: String
  , city    :: String
  , country :: String
  } deriving Show

haskellLove :: Conference
haskellLove = Conference
  { organizer = oli
  , speakers = []
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
