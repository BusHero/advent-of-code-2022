module Main where

import D01 (getMaxCalories)
import System.Exit qualified as Exit
import Test.HUnit

test1 = TestCase $ do
  let strList = ["1000"]
  let expectedResult = 1000
  let actualResult = getMaxCalories strList
  assertEqual "Sum of integers" expectedResult actualResult

test2 = TestCase $ do
  let strList = ["2000"]
  let expectedResult = 2000
  let actualResult = getMaxCalories strList
  assertEqual "Sum of integers" expectedResult actualResult

test3 = TestCase $ do
  let strList = ["1000", "2000"]
  let expectedResult = 3000
  let actualResult = getMaxCalories strList
  assertEqual "Sum of integers" expectedResult actualResult

test4 = TestCase $ do
  let strList = ["1000", "2000", "", "4000"]
  let expectedResult = 4000
  assertEqual "Sum of integers" expectedResult (getMaxCalories strList)

test5 = TestCase $ do
  let strList = ["5000", "2000", "", "4000"]
  let expectedResult = 7000
  assertEqual "Sum of integers" expectedResult (getMaxCalories strList)

adventOvCodeTest = TestCase $ do
  let strList = ["1000", "2000", "3000", "", "4000", "", "5000", "6000", "", "7000", "8000", "9000", "", "10000"]
  let expectedResult = 45000
  assertEqual "Sum of integers" expectedResult (getMaxCalories strList)

tests = TestList [adventOvCodeTest]

main = runTestTT tests
