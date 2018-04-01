module Main where

import System.IO  
import Control.Monad
import Data.Fixed
import Data.List
import Data.Maybe

main = do
  vocab <- readFile "vocab/top100.txt"
  putStrLn vocab
