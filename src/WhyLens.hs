module WhyLens where

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

oli :: Organizer
oli = Organizer
  { name = Name "Oli" "Makhasoeva"
  , contact = classified
  }

classified :: Contact
classified = undefined
