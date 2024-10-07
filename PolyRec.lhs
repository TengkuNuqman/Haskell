This lecture is about polymorphism and recursion

> module PolyRec where
> import Prelude hiding (even, odd)

Tuples have shape (a,b), (a, b, c) :

(5, 6) :: (Int, Int)

PATTERN MATCHING

> swap :: (a, b) -> (b, a)
> swap (x, y) = (y, x)

< swap (True, 3) = (3, True)

> andPair :: (Bool, Bool) -> Bool
> andPair (False, _) = False
> andPair (True, q) = q

> ignore :: a -> b -> b
> ignore _ y = y

> abcd :: (a,b,c,d) -> (d,c,b,a)
> abcd (a,b,c,d) = (d,c,b,a)

These are examples of very polymorphic functions

< const :: a -> b -> a
< const x _ = x

< id :: a -> a
< id x = x

In practice, we have a mix of polymorphism and other known types.

Mutually Recursive Functions
----------------------------

> even :: Int -> Bool
> even 0 = True
> even n
>  | n > 0 = odd(n-1)
>  | otherwise = odd(n+1)           -- To consider negative numbers

> odd :: Int -> Bool
> odd 0 = False
> odd n
>  | n > 0 = even(n-1)
>  | otherwise = even(n+1)          -- To consider negative numbers

< even 3 = odd (3-1)
<        = odd 2
<        = even (2-1)
<        = even 1
<        = odd (1-1)
<        = odd 0
<        = False

Binding Variables
-----------------

This is doing exponentiation: 'power n x' x^n

power :: Int -> Int -> Int
power 0 _ = 1
power n x = x * power (n-1) x

This function is okay but takes n steps to compute,
we can do better. Exponentiation-by-squaring computes
by dividing the exponent.

x^n - if n is even -> x^2n   -> (x^n)^2
    - if n is odd  -> x*x^2n -> x*(x^n)^2

> power :: Int -> Int -> Int
> power 0 x = 1
> power n x
>  | even n =                                   -- can be replaced with -- even n = x'' * x'' --
>       let x' = power n' x
>           n' = div n 2
>       in x' * x'
>  | otherwise = x * x'' * x''
>  where x'' = power (div n 2) x

functions and operators can be written prefix:
(&&) p q
foo x y

and infix:

p && q
x 'foo' y

More on Data Types
------------------

Bool: True, False

> data MyBool = MyFalse | MyTrue               -- defining a new data type

> myNot :: MyBool -> MyBool
> myNot MyFalse = MyTrue
> myNot MyTrue = MyFalse

In Haskell, all data types start with a capital letter, as do their values

> data Day = Mon | Tues | Wed | Thurs | Fri | Sat | Sun

> data Toggle = On | Off
> data Toggle' = On' | Off'                     -- must have unique names

< type Year = Int
< data Date = Date Month Int

> data Date = Jan Int
>           | Feb Int