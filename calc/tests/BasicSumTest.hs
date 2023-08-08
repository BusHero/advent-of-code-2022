module Main where

import BasicSum
import System.Exit qualified as Exit
import Test.HUnit

test1 = TestCase (assertEqual "should return 3" 3 (basicSum 1 2))

test2 = TestCase (assertEqual "should return 3" 5 (basicSum 3 2))

test3 = TestCase (assertEqual "should return 3" 6 (basicSum 3 3))

tests =
  TestList
    [ TestLabel "test1" test1,
      TestLabel "test2" test2
    ]

main = do
  result <- runTestTT tests
  if failures result > 0
    then Exit.exitFailure
    else Exit.exitSuccess
