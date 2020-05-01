module CEKMachine where

import Tokens
import Grammar

type Env = [(String,Exp)]
type Kontinuation = [Frames]
type State = (Exp, Env, Kont)

data Holes = HoleL | HoleR deriving Show
data Frames = Done | AddLK Holes Exp | AddRK Exp Holes


-- Add definition
step (Int e) env _ = (Int e) --not sure what should go where the _ is placed


step (Add exp1 exp2, env,kont) = step(exp1,env,AddLK HoleL exp2:kont)
step (Int a,env,AddLK HoleL exp2:kont) = step (exp2, env,AddRK (Int a) HoleR:kont)
step (Int b,env,AddRK (Int a) HoleR:kont) = step(Int (a + b),env,kont)




-- Entry point for execution
test exp = step(exp,[],[Done])