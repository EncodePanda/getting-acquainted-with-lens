module CreatingLens where

data Lenz s t a b = Lenz
  { view :: s -> a
  , set  :: (a -> b) -> (s -> t)
  }
