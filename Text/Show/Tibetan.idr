-- ------------------------------------------------------------- [ Tibetan.idr ]
-- Module      : Text.Show.Tibetan
-- Description : Parsers for Tibetan numerals.
-- --------------------------------------------------------------------- [ EOH ]
||| Module with functions to display Tibetan numerals from Integers.
module Text.Show.Tibetan

%default total

replace : (Eq a) => a -> a -> List a -> List a
replace c1 c2 l = map (\c => if c == c1 then c2 else c) l

||| Given an integer, display it using Tibetan numerals, e.g.
|||
||| ```idris example
||| showBo 13
||| ```
export
showBo : (Integral a, Show a) => a -> String
showBo i = pack . foldr (.) id fs $ iString
  where iString = unpack . show $ i
        fs : List (List Char -> List Char)
        fs = zipWith replace ['0'..'9'] ['༠','༡','༢','༣','༤','༥','༦','༧','༨','༩']

export
showTest : (Integral a, Show a) => a -> String
showTest i = pack . foldr (.) id fs $ iString
  where iString = unpack . show $ i
        fs : List (List Char -> List Char)
        fs = zipWith replace ['0'..'9'] ['0'..'9']
