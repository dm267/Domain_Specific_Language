module CEKMachine where

import Tokens
import Grammar

type Env = [(String,Exp)]
type Kont = [Frames]
type State = (Exp, Env, Kont)
type Stream = []

data Holes = HoleL | HoleR deriving Show
data Frames = Done | AddLK Holes Exp | AddRK Exp Holes


--Makes stream accessible from input
createStream :: String -> [Stream] -> [Stream]
createStream columnNumber stream
           | stream == [] = error "No Stream Input" 
           | otherwise    = 

--Int expression evaluation
step :: Exp -> Env -> Kont -> Exp
step (Int a) env kont = (Int a)

step (Add exp1 _, env, kont) = error "Wrong Input"
step (Add _ exp2, env, kont) = error "Wrong Input"
step (Add exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a + b), env, kont)

step (Minus exp1 _, env, kont) = error "Wrong Input"
step (Minus _ exp2, env, kont) = error "Wrong Input"
step (Minus exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a - b), env, kont)

step (Multiply exp1 _, env, kont) = error "Wrong Input"
step (Multiply _ exp2, env, kont) = error "Wrong Input"
step (Multiply exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a * b), env, kont)

step (Divide exp1 _, env, kont) = error "Wrong Input"
step (Divide _ exp2, env, kont) = error "Wrong Input"
step (Divide exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a `div` b), env, kont)

step (Exponential exp1 _, env, kont) = error "Wrong Input"
step (Exponential _ exp2, env, kont) = error "Wrong Input"
step (Exponential exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a ^ b), env, kont)

step (Negate exp1, env, kont) = step (exp1, env, kont)
step (Int a, env,  kont) = step (Int (-a), env, kont)


--Bool expression evaluation
step (EBool b) env kont = EBool b 

step (Equivalent exp1 _, env, kont) = error "Wrong Input"
step (Equivalent _ exp2, env, kont) = error "Wrong Input"
step (Equivalent exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a == b), env, kont)
step (EBool a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (EBool b, env, AddRK (Int a) HoleR:kont) = step (Int (a == b), env, kont)

step (Not _, env, kont) = error "Wrong Input"
step (Not exp1, env, kont) = step (exp1, env, kont)
step (Int a, env,  kont) = step (Int (not a), env, kont)
step (EBool a, env,  kont) = step (EBool (not a), env, kont)

step (And _ exp2, env, kont) = error "Wrong Input"
step (And _ exp2, env, kont) = error "Wrong Input"
step (And exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a && b), env, kont)
step (EBool a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (EBool b, env, AddRK (Int a) HoleR:kont) = step (Int (a && b), env, kont)

step (Lesser _ exp2, env, kont) = error "Wrong Input"
step (Lesser _ exp2, env, kont) = error "Wrong Input"
step (Lesser exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a < b), env, kont)
step (EBool a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (EBool b, env, AddRK (Int a) HoleR:kont) = step (Int (a < b), env, kont)

step (Greater _ exp2, env, kont) = error "Wrong Input"
step (Greater _ exp2, env, kont) = error "Wrong Input"
step (Greater exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a > b), env, kont)
step (EBool a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (EBool b, env, AddRK (Int a) HoleR:kont) = step (Int (a > b), env, kont)

step (LesserEqual _ exp2, env, kont) = error "Wrong Input"
step (LesserEqual _ exp2, env, kont) = error "Wrong Input"
step (LesserEqual exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a <= b), env, kont)
step (EBool a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (EBool b, env, AddRK (Int a) HoleR:kont) = step (Int (a <= b), env, kont)

step (GreaterEqual _ exp2, env, kont) = error "Wrong Input"
step (GreaterEqual _ exp2, env, kont) = error "Wrong Input"
step (GreaterEqual exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a >= b), env, kont)
step (EBool a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (EBool b, env, AddRK (Int a) HoleR:kont) = step (Int (a >= b), env, kont)

step (Or _ exp2, env, kont) = error "Wrong Input"
step (Or _ exp2, env, kont) = error "Wrong Input"
step (Or exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a || b), env, kont)
step (EBool a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (EBool b, env, AddRK (Int a) HoleR:kont) = step (Int (a || b), env, kont)





-- Entry point for execution
test exp = step(exp,[],[Done])