-- Write your solutions to the exercises in this file.

module Exercises
    ( change
    ) where

change :: Int -> Either String (Int, Int, Int, Int)
change amount
    | amount < 0 = Left "amount cannot be negative"
    | otherwise =
        let
            (quarters, afterQuarters) = amount `divMod` 25
            (dimes, afterDimes) = afterQuarters `divMod` 10
            (nickels, pennies) = afterDimes `divMod` 5
        in
            Right (quarters, dimes, nickels, pennies)
