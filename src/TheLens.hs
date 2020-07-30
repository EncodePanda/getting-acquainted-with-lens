{-# LANGUAGE TemplateHaskell #-}
module TheLens where

import           Control.Lens
import           Control.Lens.TH
import           Example

_organizer :: Lens' Conference Organizer
_organizer = lens getter setter
  where
    getter = organizer
    setter c o = c { organizer = o}

_name :: Lens' Conference String
_name = lens getter setter
  where
    getter (Conference n _ _) = n
    setter (Conference _ o s) n = Conference n o s

_contact :: Lens' Organizer Contact
_contact = lens contact (\o -> \c -> o { contact = c})

_address :: Lens' Contact Address
_address = lens address (\c -> \a -> c { address = a})

_country :: Lens' Address String
_country = lens country (\a -> \c -> a { country = c})

data Ticket = Ticket
  { _event :: String
  , _price :: Int
  } deriving Show
makeLenses ''Ticket
