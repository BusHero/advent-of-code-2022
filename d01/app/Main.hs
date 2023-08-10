module Main (main) where

import D01 (getMaxCalories)
import GHC.IO.Handle (isEOF)

main :: IO ()
main = do
  calories <- myLoop []
  let maxCalories = getMaxCalories calories
  putStrLn "Maximum calories are: "
  print maxCalories

myLoop :: [String] -> IO [String]
myLoop list = do
  done <- isEOF
  if done
    then return list
    else do
      inp <- getLine
      myLoop (inp : list)
