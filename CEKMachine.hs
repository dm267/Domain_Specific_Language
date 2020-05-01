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
step (Int e) env _ = (Int e) --not sure what should go where the _ is placed


step (Add exp1 exp2, env, kont) = step2 (exp1, env, AddLK HoleL exp2:kont)
step2 (Int a, env, AddLK HoleL exp2:kont) = step2 (exp2, env, AddRK (Int a) HoleR:kont)
step2 (Int b, env, AddRK (Int a) HoleR:kont) = step2 (Int (a + b), env, kont)

step (Minus exp1 exp2, env, kont) = step3 (exp1, env, AddLK HoleL exp2:kont)
step3 (Int a, env, AddLK HoleL exp2:kont) = step3 (exp2, env, AddRK (Int a) HoleR:kont)
step3 (Int b, env, AddRK (Int a) HoleR:kont) = step3 (Int (a - b), env, kont)

step (Multiply exp1 exp2, env, kont) = step4 (exp1, env, AddLK HoleL exp2:kont)
step4 (Int a, env, AddLK HoleL exp2:kont) = step4 (exp2, env, AddRK (Int a) HoleR:kont)
step4 (Int b, env, AddRK (Int a) HoleR:kont) = step4 (Int (a * b), env, kont)

step (Divide exp1 exp2, env, kont) = step5 (exp1, env, AddLK HoleL exp2:kont)
step5 (Int a, env, AddLK HoleL exp2:kont) = step5 (exp2, env, AddRK (Int a) HoleR:kont)
step5 (Int b, env, AddRK (Int a) HoleR:kont) = step5 (Int (a `div` b), env, kont)

step (Exponential exp1, env, kont) = step6 (exp1, env, AddLK HoleL exp2:kont)
step6 (Int a


step (Negate exp1, env, kont) = step6 (exp1, env,)
step6 (Int a, env) = step6 (Int (a `div` b), env, kont)


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