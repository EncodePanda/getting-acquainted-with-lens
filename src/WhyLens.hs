{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedLabels      #-}
{-# LANGUAGE TypeApplications      #-}
module WhyLens where

import           Data.Function        ((&))
import           Example
import           GHC.OverloadedLabels (IsLabel (..))

instance IsLabel "name" (Conference -> String) where
   fromLabel = name

instance IsLabel "name" (Organizer -> Name) where
   fromLabel = name

instance IsLabel "name" (Speaker -> Name) where
   fromLabel = name

organizerCountry :: Conference -> String
organizerCountry conf =
  conf & organizer & contact & address & country

organizerName :: Conference -> Name
organizerName conference =
  conference & organizer & #name


changeOrganizerEmail :: (String -> String) -> Conference ->  Conference
changeOrganizerEmail modifyEmail conference =
  let
    oldOrganizer = conference & organizer
    newContact = (oldOrganizer & contact)
      { email = modifyEmail (oldOrganizer & contact & email)
      }
    newOrganizer = oldOrganizer { contact = newContact}
  in
    conference { organizer = newOrganizer }

allSpeakersNotReady :: Conference -> Conference
allSpeakersNotReady conference =
  let
    oldSpeakers = conference & speakers
  in
    conference {
      speakers = fmap (\s -> s { slidesReady = False}) oldSpeakers
    }
