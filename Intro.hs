module Intro where

fib :: Integer -> Integer
-- v body (expression)
fib 0 = 1
fib 1 = 1
fib n
    | n < 0 = error "woah stop"
    | otherwise = fib(n-1) + fib (n-2)
--  ^ arguments