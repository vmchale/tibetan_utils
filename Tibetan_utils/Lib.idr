-- ----------------------------------------------------------------- [ Lib.idr ]
-- Module      : Tibetan_utils.Lib
-- Description : 
-- --------------------------------------------------------------------- [ EOH ]
module Tibetan_utils.Lib

import public Lightyear
import public Lightyear.Char
import public Lightyear.Strings

%access export

parseNumeral : (Integral a) => Parser a
--parseNumeral = foldr (<|>) (parseDigit '༠' "0") ((zipWith : (Integral a) => (Char -> a -> Parser a) -> List Char -> List a -> List (Parser a)) parseDigit "༠༡༢༣༤༥༦༧༨༩" (0:[1..10]))
parseNumeral = foldr (<|>) (parseDigit '༠' "0") (zipWith parseDigit "༠༡༢༣༤༥༦༧༨༩" (0:[1..10]))

parseDigit : (Integral a) => Char -> a -> Parser a
parseDigit c i = do
  char c
  pure i
