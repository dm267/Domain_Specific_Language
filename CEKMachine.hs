module CEKMachine where

import Tokens
import Grammar

type Env = [(String,Exp)]
type Kont = [Frames]
type State = (Exp, Env, Kont)
type Stream = []

data Holes = HoleL | HoleR deriving Show
data Frames = Done | IfK Stmt1 Stmt2 | WhileK Exp | AssignmentK Exp | AddLK Holes Exp | AddRK Exp Holes


--Makes stream accessible from input
createStream :: String -> [Stream] -> [Stream]
createStream columnNumber stream
           | stream == [] = error "No Stream Input" 
           | otherwise    =

-- EIf definition
step (EIf cond stmt1 stmt2, env, kont) = step(cond, env, IfK stmt1 stmt2: kont)
step (Boolean True, env, IfK stmt1 stmt2: kont) = step(stmt1, env, kont)
step (Boolean False, env, IfK exp: kont) = step(stmt2, env, kont)

-- EWhile definition
step (EWhile cond exp, env, kont) = step(cond, env, WhileK exp: kont)
step (Boolean True, env, WhileK exp: kont) = step(stmt1, env, kont)
step (Boolean False, env, WhileK exp: kont) = step(EBool False, env, kont)

-- EAssignment definition
step (EAssignment var exp, env, kont) = step(exp, env, AssignmentK var: kont)
step (Int a, env, AssignmentK var:kont) = step(exp, (var, Int a):env, kont)
step (EBool b, env, AssignmentK var:kont) = step(exp, (var, EBool b):env, kont)

-- Add definition
step (Add exp1 _, env, kont) = error "Wrong Input"
step (Add _ exp2, env, kont) = error "Wrong Input"
step (Add exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a + b), env, kont)

-- Minus definition
step (Minus exp1 _, env, kont) = error "Wrong Input"
step (Minus _ exp2, env, kont) = error "Wrong Input"
step (Minus exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a - b), env, kont)

-- Multiply definition
step (Multiply exp1 _, env, kont) = error "Wrong Input"
step (Multiply _ exp2, env, kont) = error "Wrong Input"
step (Multiply exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a * b), env, kont)

-- Divide definition
step (Divide exp1 _, env, kont) = error "Wrong Input"
step (Divide _ exp2, env, kont) = error "Wrong Input"
step (Divide exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a `div` b), env, kont)

-- Exponential definition
step (Exponential exp1 _, env, kont) = error "Wrong Input"
step (Exponential _ exp2, env, kont) = error "Wrong Input"
step (Exponential exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a ^ b), env, kont)

-- Negative definition
step (Negative exp1, env, kont) = step (exp1, env, kont)
step (Int a, env,  kont) = step (Int (-a), env, kont)

-- Equivalent definition
step (Equivalent exp1 _, env, kont) = error "Wrong Input"
step (Equivalent _ exp2, env, kont) = error "Wrong Input"
step (Equivalent exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a == b), env, kont)
step (EBool a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (EBool b, env, AddRK (Int a) HoleR:kont) = step (Int (a == b), env, kont)

-- Not definition
step (Not _, env, kont) = error "Wrong Input"
step (Not exp1, env, kont) = step (exp1, env, kont)
step (Int a, env,  kont) = step (Int (not a), env, kont)
step (EBool a, env,  kont) = step (EBool (not a), env, kont)

-- And definition
step (And _ exp2, env, kont) = error "Wrong Input"
step (And _ exp2, env, kont) = error "Wrong Input"
step (And exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a && b), env, kont)
step (EBool a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (EBool b, env, AddRK (Int a) HoleR:kont) = step (Int (a && b), env, kont)

-- Lesser definition
step (Lesser _ exp2, env, kont) = error "Wrong Input"
step (Lesser _ exp2, env, kont) = error "Wrong Input"
step (Lesser exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a < b), env, kont)
step (EBool a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (EBool b, env, AddRK (Int a) HoleR:kont) = step (Int (a < b), env, kont)

-- Greater definition
step (Greater _ exp2, env, kont) = error "Wrong Input"
step (Greater _ exp2, env, kont) = error "Wrong Input"
step (Greater exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a > b), env, kont)
step (EBool a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (EBool b, env, AddRK (Int a) HoleR:kont) = step (Int (a > b), env, kont)

-- LesserEqual definition
step (LesserEqual _ exp2, env, kont) = error "Wrong Input"
step (LesserEqual _ exp2, env, kont) = error "Wrong Input"
step (LesserEqual exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a <= b), env, kont)
step (EBool a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (EBool b, env, AddRK (Int a) HoleR:kont) = step (Int (a <= b), env, kont)

-- GreaterEqual definition
step (GreaterEqual _ exp2, env, kont) = error "Wrong Input"
step (GreaterEqual _ exp2, env, kont) = error "Wrong Input"
step (GreaterEqual exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a >= b), env, kont)
step (EBool a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (EBool b, env, AddRK (Int a) HoleR:kont) = step (Int (a >= b), env, kont)

-- Or definition
step (Or _ exp2, env, kont) = error "Wrong Input"
step (Or _ exp2, env, kont) = error "Wrong Input"
step (Or exp1 exp2, env, kont) = step (exp1, env, AddLK HoleL exp2:kont)
step (Int a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (Int b, env, AddRK (Int a) HoleR:kont) = step (Int (a || b), env, kont)
step (EBool a, env, AddLK HoleL exp2:kont) = step (exp2, env, AddRK (Int a) HoleR:kont)
step (EBool b, env, AddRK (Int a) HoleR:kont) = step (Int (a || b), env, kont)

-- lowest level of evaluation for primitives
step state = state


-- Entry point for execution
test exp = step(exp,[],[Done])