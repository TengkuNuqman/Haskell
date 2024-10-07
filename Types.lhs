Different values and types

Int      : [-2^63, 2^63 - 1]              8-byte big (64 bit)          --
Integer  : [-infinity, infinity]          unlimited-bytes              --unbounded amount of stuff
FLoat - 32 bits
Double - 64 bits

Bool     : [True, False]
    otherwise :: Bool
    otherwise = True

String   : "some stuff"          -- type String = [Char]     -- Use "++" to concatenate strings
Char     : 'a'

List     : 
    [Char] (aka String), [Int], [Bool], [[Int]], [(Bool),(Bool)]
    - cannot have different types
    - "++" does not change a list
    - ['a','b','c']
    - 'a' : 'b' : 'c' : []
    - : is "cons"

Tuples   :
    (Char, Bool), (Bool, Char), (Bool, Bool), (Char, Char, Char)
    - () is called "unit" -- useless!!
    - Tuples are ordered
    -- > divMod 6 4
    -- > (1,2)
    - Can be different types

(&&) :: Bool -> Bool -> Bool
False && _ = False
True && q = q
