module Main where

import D02 (rockPaperSisors)
import System.Exit qualified as Exit
import Test.HUnit

testAAndXReturns4 = TestCase $ do
  let strategy = ["A X"]
  let expectedResult = 4
  let actualResult = rockPaperSisors strategy
  assertEqual "Sum of integers" expectedResult actualResult

testAAndYReturns8 = TestCase $ do
  let strategy = ["A Y"]
  let expectedResult = 8
  let actualResult = rockPaperSisors strategy
  assertEqual "Sum of integers" expectedResult actualResult

testAAndZReturns3 = TestCase $ do
  let strategy = ["A Z"]
  let expectedResult = 3
  let actualResult = rockPaperSisors strategy
  assertEqual "Sum of integers" expectedResult actualResult

testBAndXReturns4 = TestCase $ do
  let strategy = ["B X"]
  let expectedResult = 1
  let actualResult = rockPaperSisors strategy
  assertEqual "Sum of integers" expectedResult actualResult

testBAndYReturns8 = TestCase $ do
  let strategy = ["B Y"]
  let expectedResult = 5
  let actualResult = rockPaperSisors strategy
  assertEqual "Sum of integers" expectedResult actualResult

testBAndZReturns3 = TestCase $ do
  let strategy = ["B Z"]
  let expectedResult = 9
  let actualResult = rockPaperSisors strategy
  assertEqual "Sum of integers" expectedResult actualResult

testCAndXReturns4 = TestCase $ do
  let strategy = ["C X"]
  let expectedResult = 7
  let actualResult = rockPaperSisors strategy
  assertEqual "Sum of integers" expectedResult actualResult

testCAndYReturns8 = TestCase $ do
  let strategy = ["C Y"]
  let expectedResult = 2
  let actualResult = rockPaperSisors strategy
  assertEqual "Sum of integers" expectedResult actualResult

testCAndZReturns3 = TestCase $ do
  let strategy = ["C Z"]
  let expectedResult = 6
  let actualResult = rockPaperSisors strategy
  assertEqual "Sum of integers" expectedResult actualResult

testAXAYReturns4 = TestCase $ do
  let strategy = ["A X", "A Y"]
  let expectedResult = 12
  let actualResult = rockPaperSisors strategy
  assertEqual "Sum of integers" expectedResult actualResult

tests =
  TestList
    [ testAAndXReturns4,
      testAAndYReturns8,
      testAAndZReturns3,
      testBAndXReturns4,
      testBAndYReturns8,
      testBAndZReturns3,
      testCAndXReturns4,
      testCAndYReturns8,
      testCAndZReturns3,
      testAXAYReturns4
    ]

main = do
  result <- runTestTT tests
  if failures result > 0
    then Exit.exitFailure
    else Exit.exitSuccess
