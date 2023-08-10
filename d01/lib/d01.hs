module D01 where

import Data.Function ((&))

getMaxCalories :: [String] -> Int
-- getMaxCalories x = x & map (\str -> read str :: Int) & sum
getMaxCalories x = bar x [] & foldr max 0

bar :: [String] -> [Int] -> [Int]
bar [] remaining = remaining
bar (head : tail) remaining = foo (head : tail) 0 & (\t -> bar (fst t) (remaining ++ [snd t]))

foo :: [String] -> Int -> ([String], Int)
foo [] sum = ([], sum)
foo ("" : tail) sum = (tail, sum)
foo (head : tail) sum = foo tail (sum + read head :: Int)
