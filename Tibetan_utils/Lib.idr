-- ----------------------------------------------------------------- [ Lib.idr ]
-- Module      : Tibetan_utils.Lib
-- Description : 
-- --------------------------------------------------------------------- [ EOH ]
module Tibetan_utils.Lib

import public Lightyear
import public Lightyear.Char
import public Lightyear.Strings

%access export

parseDigit : Char -> Int -> Parser Int -- (Integral a) => Char -> a -> Parser a
parseDigit c i = do
  char c
  pure i

parseNumeral : Parser Int
parseNumeral = foldr (<|>) (parseDigit '༠' 0) $ zipWith parseDigit string (0::[1..10])
  where string = unpack "༠༡༢༣༤༥༦༧༨༩"
