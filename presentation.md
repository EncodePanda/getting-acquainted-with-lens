footer: @EncodePanda, paul.szulc@gmail.com
slidenumbers: true

# [fit] "Getting acquainted with __Lens__"

### @EncodePanda

---

# This talk is about __Lens__[^1]

1. What problem they are trying to solve?
2. How we can use them?
3. How they are being implemented?

[^1]: [https://hackage.haskell.org/package/lens](https://hackage.haskell.org/package/lens).

---

# There are two things fundamentally broken in Haskell

1. Record syntax
2. Strings

---

# There are two things fundamentally broken in Haskell

1. Record syntax
2. ~~Strings~~

---

# Record syntax broken?

> "The record system is a continual source of pain"
- Stephen Diehl

<!-- https://www.stephendiehl.com/posts/production.html -->

---

# Record syntax broken?

> "What is your least favorite thing about Haskell? Records are still tedious"
- 2018 State of Haskell Survey

---

# Record syntax broken?

> "Shitty records."
- Someone on reddit

---

# The Example

---

```haskell
data Conference = Conference
  { organizer :: Organizer
  , speakers  :: [Speaker]
  } deriving Show
```

---

```haskell
data Conference = Conference
  { organizer :: Organizer
  , speakers  :: [Speaker]
  } deriving Show

data Organizer = Organizer
  { name    :: Name
  , contact :: Contact
  } deriving Show
```

---

```haskell
data Organizer = Organizer
  { name    :: Name
  , contact :: Contact
  } deriving Show
```

---

[.code-highlight: 2,5-9]

```haskell
data Organizer = Organizer
  { name    :: Name
  , contact :: Contact
  } deriving Show

data Name = Name
  { firstName :: String
  , lastName  :: String
  } deriving Show
```

---

[.code-highlight: 3,5-9]

```haskell
data Organizer = Organizer
  { name    :: Name
  , contact :: Contact
  } deriving Show

data Contact = Contact
  { address :: Address
  , email   :: String
  } deriving Show
```

---

```haskell
data Address = Address
  { street  :: String
  , city    :: String
  , country :: String
  } deriving Show
```

---

```haskell
data Conference = Conference
  { organizer :: Organizer
  , speakers  :: [Speaker]
  } deriving Show
```

---
[.code-highlight: 3,6-8]

```haskell
data Conference = Conference
  { organizer :: Organizer
  , speakers  :: [Speaker]
  } deriving Show

data Speaker = Speaker
  { slidesReady :: Bool
  } deriving Show
```

---

# Getting things from a record

---

```haskell
data Conference = Conference
  { organizer :: Organizer
  , speakers  :: [Speaker]
  } deriving Show

oli :: Organizer
oli = Organizer
  { name = Name "Oli" "Makhasoeva"
  , contact = classified
  }
```

---

```haskell
data Conference = Conference
  { organizer :: Organizer
  , speakers  :: [Speaker]
  } deriving Show
```

```haskell
λ> name oli
Name {firstName = "Oli", lastName = "Makhasoeva"}
```
