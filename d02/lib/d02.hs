module D02 (rockPaperSisors, foo) where

import Data.Function ((&))

data Hands = Rock | Paper | Scrissors

data Result = Win | Loss | Draw

rockPaperSisors :: [String] -> Int
rockPaperSisors list = list & foo & map getMatchResult & sum

foo :: [String] -> [(Char, Char)]
foo = map ((\[[first], [second]] -> (first, second)) . words)

getMatchResult :: (Char, Char) -> Int
getMatchResult (first, second) =
  (charToHand first, charToHand second)
    & (\hands -> (uncurry getWinStatus hands & getWinPoints) + getComboPoints (snd hands))

charToHand :: Char -> Hands
charToHand 'A' = Rock
charToHand 'X' = Rock
charToHand 'B' = Paper
charToHand 'Y' = Paper
charToHand 'C' = Scrissors
charToHand 'Z' = Scrissors

getWinPoints :: Result -> Int
getWinPoints Win = 6
getWinPoints Draw = 3
getWinPoints Loss = 0

getWinStatus :: Hands -> Hands -> Result
getWinStatus Rock Rock = Draw
getWinStatus Rock Paper = Win
getWinStatus Rock Scrissors = Loss
getWinStatus Paper Rock = Loss
getWinStatus Paper Paper = Draw
getWinStatus Paper Scrissors = Win
getWinStatus Scrissors Rock = Win
getWinStatus Scrissors Paper = Loss
getWinStatus Scrissors Scrissors = Draw

getComboPoints :: Hands -> Int
getComboPoints Rock = 1
getComboPoints Paper = 2
getComboPoints Scrissors = 3
