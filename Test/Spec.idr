module Test.Spec

import Specdris.Spec
import Tibetan_utils.Lib

export

specSuite : IO ()
specSuite = do
  spec $ do
    describe "readTest" $ do
      it "should parse Latin numerals" $ do
        readTest "126" `shouldBe` Right 126
        --readBo "༡༢༦" `shouldBe` Right 126
