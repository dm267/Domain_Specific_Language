module CEKMachine where

import Tokens
import Grammar

type Env = [(String,Exp)]
type Kont = [Frames]
type State = (Exp, Env, Kont)

data Holes = HoleL | HoleR deriving Show
data Frames = Done | AddLK Holes Exp | AddRK Exp Holes


--Int expression evaluation
step (Int e) env _ = (Int e) --not sure what should go where the _ is placed


step (Add exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step(Int (a + b), env, kont)

step (Minus exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step(Int (a - b), env, kont)

step (Multiply exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)




step (Divide exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)




step (Exponential exp1, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)



step (Negate exp1, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)


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