module CEKMachine where

import Tokens
import Grammar

type Env = [(String,Exp)]
type Kont = [Frames]
type State = (Exp, Env, Kont)

data Holes = HoleL | HoleR deriving Show
data Frames = Done | AddLK Holes Exp | AddRK Exp Holes
data Stream = []

--Makes stream accessible from input
createStream :: String -> [Stream] -> [Stream]
createStream columnNumber stream
           | stream == [] = error "No Stream Input" 
           | otherwise    = 

--Int expression evaluation
step (Int e) env kont = (Int e)

step (Add exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a + b), env, kont)

step (Minus exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a - b), env, kont)

step (Multiply exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a * b), env, kont)

step (Divide exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a `div` b), env, kont)

step (Exponential exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a ^ b), env, kont)

step (Negate exp1, env, kont) = step (exp1, env, kont)
step (Int a, env,  kont) = step (Int (-a), env, kont)


--Bool expression evaluation
step (EBool 

step (Equivalent 

step (Not

step (And

step (Lesser

step (Greater

step (LesserEqual

step (GreaterEqual

step (Or






-- Entry point for execution
test exp = step(exp,[],[Done])