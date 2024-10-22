module Exercises
    ( change,
      firstThenApply,
      powers
    ) where

import qualified Data.Map as Map
import Data.Text (pack, unpack, replace)
import Data.List(isPrefixOf, find)
import Data.Char(isSpace)
import Data.Type.Equality (apply)

change :: Integer -> Either String (Map.Map Integer Integer)
change amount
    | amount < 0 = Left "amount cannot be negative"
    | otherwise = Right $ changeHelper [25, 10, 5, 1] amount Map.empty
        where
          changeHelper [] remaining counts = counts
          changeHelper (d:ds) remaining counts =
            changeHelper ds newRemaining newCounts
              where
                (count, newRemaining) = remaining `divMod` d
                newCounts = Map.insert d count counts

firstThenApply :: [a] -> (a -> Bool) -> (a -> b) -> Maybe b
firstThenApply [] _ _ = Nothing
firstThenApply x p f = f <$> find p x

numsFrom n = n : numsFrom (n + 1)
powers :: Integer -> [Integer]
powers n = map (n^) (numsFrom 0) 

-- Write your line count function here

-- Write your shape data type here

-- Write your binary search tree algebraic type here
