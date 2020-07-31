module CreatingLens where

import           Example

data Lenz s t a b = Lenz
  { view :: s -> a
  , set  :: b -> s -> t
  }

over :: Lenz s t a b -> (a -> b) -> s -> t
over lenz func s =
  let
    old = view lenz s
    new = func old
  in
    set lenz new s

type Lenz' s a = Lenz s s a a

_organizer :: Lenz' Conference Organizer
_organizer = Lenz getter setter
  where
    getter = organizer
    setter o c = c { organizer = o}
