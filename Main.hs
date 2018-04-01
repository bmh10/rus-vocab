module Main where

import System.IO  
import Control.Monad
import Data.Fixed
import Data.List
import Data.Maybe

test [] = do
  putStrLn "Lesson completed"

test (v:vs) = do
  putStrLn $ "What is the English for " ++ rus ++ "?"
  ans <- getLine
  if ans == eng 
    then putStrLn "Correct"
    else putStrLn $ "Incorrect, the correct answer was '" ++ eng ++ "'"

  test vs
  where
    ws  = words v
    rus = ws !! 0
    eng = ws !! 1 

main = do
  vocab <- readFile "vocab/top100.txt"
  test $ lines vocab 
