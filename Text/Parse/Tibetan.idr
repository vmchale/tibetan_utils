-- ------------------------------------------------------------- [ Tibetan.idr ]
-- Module      : Text.Parse.Tibetan
-- Description : Parsers for Tibetan numerals.
-- --------------------------------------------------------------------- [ EOH ]
||| This module contains an integer parser for Tibetan numerals.
module Text.Parse.Tibetan

import public Data.Composition
import public Lightyear
import public Lightyear.Char
import public Lightyear.Strings

parseDigit : (Integral a) => Char -> a -> Parser a
parseDigit c i = do
  char c
  pure i

-- TODO figure out how to make this lazy
parseNumeral : Parser Int
parseNumeral = foldr (<|>) (parseDigit '༠' 0) $ zipWith parseDigit s (0::[1..10])
  where s = unpack "༠༡༢༣༤༥༦༧༨༩"

parseNumeralFake : Parser Int
parseNumeralFake = foldr (<|>) (parseDigit '0' 0) $ zipWith parseDigit s (0::[1..10])
  where s = unpack "0123456789"

parseLatin : Parser Int
parseLatin = do
  digits <- reverse <$> some parseNumeralFake
  (pure . (\x => div x 10) $ foldr ((*10) .* (+)) 0 digits) <?> "Tibetan integer"

||| A lightyear parser for Tibetan numerals.
export
parseNumber : Parser Int
parseNumber = do
  digits <- reverse <$> some parseNumeral
  (pure . (\x => div x 10) $ foldr ((*10) .* (+)) 0 digits) <?> "Tibetan integer"

||| Given a 'String', try to parse it as an integer written using Tibetan numerals. If this fails, return a 'String' explaining why.
export
readBo : String -> Either String Int
readBo = parse (parseNumber)

export
readTest : String -> Either String Int
readTest = parse parseLatin
