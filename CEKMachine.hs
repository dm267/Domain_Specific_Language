module CEKMachine where

import Tokens
import Grammar

type Env = [(String,Exp)]
type Kont = [Frames]
type State = (Exp, Env, Kont)
type Stream = []

data Holes = HoleL | HoleR deriving Show
data Frames = Done | IfK Exp Exp | WhileK Exp | AssignmentK String | LK Holes Exp | RK Exp Holes | NotK Exp | NegativeK Exp | EndK Exp | PrintK Exp deriving Show


-- step Defintion
--step :: Exp -> Env -> Kont -> (Exp, Env, Kont)

-- EIf definition
step (EIf cond stmt1 stmt2, env, kont) = step(cond, env, IfK stmt1 stmt2: kont)
step (EBool True, env, IfK stmt1 stmt2: kont) = step(stmt1, env, kont)
step (EBool False, env, IfK stmt1 stmt2: kont) = step(stmt2, env, kont)

-- EWhile definition
step (EWhile cond exp, env, kont) = step(cond, env, WhileK exp: kont)
step (EBool True, env, WhileK exp: kont) = step(exp, env, kont)
step (EBool False, env, WhileK exp: kont) = step(EBool False, env, kont)

-- EAssignment definition
step (EAssignment var exp, env, kont) = step(exp, env, AssignmentK var: kont)
step (EInt a, env, AssignmentK var:kont) = step((EInt a), (var, EInt a):env, kont)
step (EBool b, env, AssignmentK var:kont) = step((EBool b), (var, EBool b):env, kont)

-- Var lookup definition
step (Var exp, env, kont) = case lookup exp env of
                            Just (EInt a) -> step(EInt a, env, kont)
                            Just (EBool b) -> step(EBool b, env, kont)
                            Nothing -> error "Variable not found"

-- Add definition
step (Add exp1 exp2, env, kont) = step (exp1, env, LK HoleL exp2:kont)
step (EInt a, env, LK HoleL exp2:kont) = step (exp2, env, RK (EInt a) HoleR:kont)
step (EInt b, env, RK (EInt a) HoleR:kont) = step (EInt (a + b), env, kont)


-- Minus definition
step (Minus exp1 exp2, env, kont) = step (exp1, env, LK HoleL exp2:kont)
step (EInt a, env, LK HoleL exp2:kont) = step (exp2, env, RK (EInt a) HoleR:kont)
step (EInt b, env, RK (EInt a) HoleR:kont) = step (EInt (a - b), env, kont)


-- Multiply definition
step (Multiply exp1 exp2, env, kont) = step (exp1, env, LK HoleL exp2:kont)
step (EInt a, env, LK HoleL exp2:kont) = step (exp2, env, RK (EInt a) HoleR:kont)
step (EInt b, env, RK (EInt a) HoleR:kont) = step (EInt (a * b), env, kont)


-- Divide definition
step (Divide exp1 exp2, env, kont) = step (exp1, env, LK HoleL exp2:kont)
step (EInt a, env, LK HoleL exp2:kont) = step (exp2, env, RK (EInt a) HoleR:kont)
step (EInt b, env, RK (EInt a) HoleR:kont) = step (EInt (a `div` b), env, kont)


-- Exponential definition
step (Exponential exp1 exp2, env, kont) = step (exp1, env, LK HoleL exp2:kont)
step (EInt a, env, LK HoleL exp2:kont) = step (exp2, env, RK (EInt a) HoleR:kont)
step (EInt b, env, RK (EInt a) HoleR:kont) = step (EInt (a ^ b), env, kont)

-- Negative definition
step (Negative exp1, env, kont) = step (exp1, env, NegativeK exp1:kont)
step (EInt a, env, NegativeK exp1:kont) = step (EInt (-a), env, kont)

-- Equivalent definition
step (Equivalent exp1 exp2, env, kont) = step (exp1, env, LK HoleL exp2:kont)
step (EInt a, env, LK HoleL exp2:kont) = step (exp2, env, RK (EInt a) HoleR:kont)
step (EInt b, env, RK (EInt a) HoleR:kont) = step (EBool (a == b), env, kont)
step (EBool a, env, LK HoleL exp2:kont) = step (exp2, env, RK (EBool a) HoleR:kont)
step (EBool b, env, RK (EBool a) HoleR:kont) = step (EBool (a == b), env, kont)


-- Not definition
step (Not exp1, env, kont) = step (exp1, env, NotK exp1:kont)
step (EBool a, env, NotK exp1:kont) = step (EBool (not a), env, kont)


-- And definition
step (And exp1 exp2, env, kont) = step (exp1, env, LK HoleL exp2:kont)
step (EBool a, env, LK HoleL exp2:kont) = step (exp2, env, RK (EBool a) HoleR:kont)
step (EBool b, env, RK (EBool a) HoleR:kont) = step (EBool (a && b), env, kont)


-- Lesser definition
step (Lesser exp1 exp2, env, kont) = step (exp1, env, LK HoleL exp2:kont)
step (EInt a, env, LK HoleL exp2:kont) = step (exp2, env, RK (EInt a) HoleR:kont)
step (EInt b, env, RK (EInt a) HoleR:kont) = step (EBool (a < b), env, kont)


-- Greater definition
step (Greater exp1 exp2, env, kont) = step (exp1, env, LK HoleL exp2:kont)
step (EInt a, env, LK HoleL exp2:kont) = step (exp2, env, RK (EInt a) HoleR:kont)
step (EInt b, env, RK (EInt a) HoleR:kont) = step (EBool (a > b), env, kont)


-- LesserEqual definition
step (LesserEqual exp1 exp2, env, kont) = step (exp1, env, LK HoleL exp2:kont)
step (EInt a, env, LK HoleL exp2:kont) = step (exp2, env, RK (EInt a) HoleR:kont)
step (EInt b, env, RK (EInt a) HoleR:kont) = step (EBool (a <= b), env, kont)


-- GreaterEqual definition
step (GreaterEqual exp1 exp2, env, kont) = step (exp1, env, LK HoleL exp2:kont)
step (EInt a, env, LK HoleL exp2:kont) = step (exp2, env, RK (EInt a) HoleR:kont)

-- Or definition
step (Or exp1 exp2, env, kont) = step (exp1, env, LK HoleL exp2:kont)
step (EBool a, env, LK HoleL exp2:kont) = step (exp2, env, RK (EBool a) HoleR:kont)
step (EBool b, env, RK (EBool a) HoleR:kont) = step (EBool (a || b), env, kont)

-- End Expression definition
step (End exp1 exp2, env, kont) = step (exp1, env, EndK exp2:kont)
step (exp1, env, EndK exp2:kont) = step (exp2, env, kont)

-- Print Expression definition
step (EPrint exp1, env, kont) = step (exp1, env, PrintK exp1:kont)
step (EBool a, env, PrintK exp1:kont) = (step (EBool a, env, kont))
step (EString a, env, PrintK exp1:kont) = (step (EString a, env, kont))
step (EInt a, env, PrintK exp1:kont) = (step (EInt a, env, kont))

-- Lowest level of evaluation for primitives
step state = state

-- Evaluates the program and returns a final expression
evalProg :: Exp -> String
evalProg exp =  unwrap ((\(a,_,_) -> a) (step(exp, [], [Done])))

--Unwraps pure to value
unwrap (EInt a) = show a
unwrap (EString a) = show a
unwrap (EBool a) = show a


-- Entry poEInt for execution
test exp = step(exp,[],[Done])