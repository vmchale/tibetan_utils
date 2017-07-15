-- ------------------------------------------------------------- [ Tibetan.idr ]
-- Module      : Text.Parse.Tibetan
-- Description : Parsers for Tibetan numerals.
-- --------------------------------------------------------------------- [ EOH ]
module Text.Parse.Tibetan

%default total

%access export

replace : (Eq a) => a -> a -> List a -> List a
replace c1 c2 l = map (\c => if c == c1 then c2 else c) l

showBo : (Integral a, Show a) => a -> String
showBo i = pack . foldr (.) id fs $ iString
  where iString = unpack . show $ i
        fs : List (List Char -> List Char)
        fs = zipWith replace ['0'..'9'] ['༠','༡','༢','༣','༤','༥','༦','༧','༨','༩']

showTest : (Integral a, Show a) => a -> String
showTest i = pack . foldr (.) id fs $ iString
  where iString = unpack . show $ i
        fs : List (List Char -> List Char)
        fs = zipWith replace ['0'..'9'] ['0'..'9']
