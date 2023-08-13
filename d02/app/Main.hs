module Main (main) where

import D02 (rockPaperSisors)
import Data.Function ((&))
import GHC.IO.Handle (isEOF)

main :: IO ()
main = do
  lines <- getLines []
  let result = rockPaperSisors lines
  print result

getLines :: [String] -> IO [String]
getLines list = do
  done <- isEOF
  if done
    then return list
    else do
      inp <- getLine
      getLines (inp : list)
