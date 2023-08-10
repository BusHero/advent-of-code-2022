module D01 (getMaxCalories) where

import Data.Function ((&))
import Data.List (sort)

getMaxCalories :: [String] -> Int
getMaxCalories x = foo x []

foo :: [String] -> [Int] -> Int
foo [] remaining = remaining & sort & reverse & take 3 & sum
foo ("" : tail) remaining = foo tail (0 : remaining)
foo (head : tail) [] = foo tail [read head :: Int]
foo (head : tail) [head2] = foo tail [head2 + read head :: Int]
foo (head : tail) (head2 : tail2) = foo tail (head2 + (read head :: Int) : tail2)
