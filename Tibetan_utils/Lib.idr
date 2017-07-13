-- ----------------------------------------------------------------- [ Lib.idr ]
-- Module      : Tibetan_utils.Lib
-- Description : 
-- --------------------------------------------------------------------- [ EOH ]
module Tibetan_utils.Lib

import public Lightyear
import public Lightyear.Char
import public Lightyear.Strings

%access export

infixr 10 .*

(.*) : (c -> d) -> (a -> b -> c) -> (a -> b -> d)
(.*) f g = \x, y => f (g x y)

parseDigit : (Integral a) => Char -> a -> Parser a
parseDigit c i = do
  char c
  pure i

parseNumeral : Parser Int
parseNumeral = foldr (<|>) (parseDigit '༠' 0) $ zipWith parseDigit string (0::[1..10])
  where string = unpack "༠༡༢༣༤༥༦༧༨༩"

export

parseNumber : Parser Int
parseNumber = do
  digits <- reverse <$> some parseNumeral
  (pure . (\x => div x 10) $ foldr ((*10) .* (+)) 0 digits) <?> "Tibetan integer"

readBoV : String -> Either String Int
readBoV = parse (parseNumber)
