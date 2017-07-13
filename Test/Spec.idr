module Test.Spec

import Specdris.Spec
import Tibetan_utils.Lib

export

specSuite : IO ()
specSuite = spec $ do
  describe "readBoV" $ do
    it "should parse a tibetan numeral" $ do
      readBoV "༡༢༦" `shouldBe` Right 126
