module Main where

import System.IO  
import Control.Monad
import Data.Fixed
import Data.List
import Data.Maybe

data Meta = Meta { correct :: Int, total :: Int } deriving (Eq, Show)

updateMeta meta isCorrect =
  if isCorrect then meta { correct = (correct meta) + 1} else meta

test [] meta = do
  putStrLn $ "Lesson completed, you scored " ++ show (correct meta) ++ "/" ++ show ()

test (v:vs) meta = do
  putStrLn $ "What is the English for " ++ rus ++ "?"
  ans <- getLine
  let isCorrect = ans == eng
  if isCorrect
    then putStrLn "Correct"
    else putStrLn $ "Incorrect, the correct answer was '" ++ eng ++ "'"

  test vs (updateMeta meta isCorrect)
  where
    ws  = words v
    rus = ws !! 0
    eng = ws !! 1 

main = do
  fileContents <- readFile "vocab/top100.txt"
  let vocab = lines fileContents
  let meta = Meta { correct = 0, total = length vocab }
  test vocab meta
