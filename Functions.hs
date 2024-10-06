-- Functions and evaluation

module Functions where

square :: Integer -> Integer
square n = n * n -- <- is the body

--         ^ that is an argument

two :: Integer -> Integer 
two _ = 2                   -- "_" means we don't care about the argument

infinity :: Integer
infinity = infinity + 1

-- If there is an answer, by-need (laziness) will find it
-- Strict evaluation might not

twice :: Integer -> Integer
twice n = n + n

{-

LAZY EVALUATION (by need)
 twice (square 2+1) = square (2+1) + square (2+1)           #outermost in approach
                    = ((2+1) * (2+1)) + square (2+1)
                    = 3 * (2+1) + square (2+1)
                    = 3 * 3 + square (2+1)
                    = 9 + ((2+1) * (2+1)) 

STRICT EVALUATION (by value)
 twice (square 2+1) = twice (square(3))                     #innermost out approach 
                    = twice (9)
                    = 18

-}

-- strict is faster but lazy is better to ignore things (e.g infinity)

fact :: Integer -> Integer
fact 1 = 1
fact n
 | n == 1    = 1
 | n > 1     = n * fact (n-1)        -- "|" are guards       <- pattern matching
 | otherwise = undefined

{- 
fact (0+1) = fact 1
      ^ the program has to evaluate this first so its strict 
-}

{-
IF EXPRESSIONS
if <condition> then x1, else x2
-}