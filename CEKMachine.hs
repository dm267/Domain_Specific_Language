module CEKMachine where

import Tokens
import Grammar
import System.IO.Unsafe (unsafePerformIO)

type Env = [(String,Exp)]
type Kont = [Frames]
type State = (Exp, Env, Kont, Streams)

type Streams = [[Int]]

data Holes = HoleL | HoleR deriving Show
data Frames = Done | IfK Exp Exp | WhileK Exp | AssignmentK String | LK Holes Exp | RK Exp Holes | NotK Exp | NegativeK Exp | EndK Exp | PrintK Exp | IncSK Exp deriving Show

-- Checks for terminated expressions
isValue :: Exp -> Bool
isValue (EInt _) = True
isValue (EBool _) = True
isValue (EString _) = True
isValue _ = False

updateStreams :: [[Int]] -> [[Int]]
updateStreams streams
    | length streams == 0 = map (\x -> [x]) (unsafePerformIO readStdIn)
    | otherwise = zipWith (\x y -> x ++ [y]) streams (unsafePerformIO readStdIn)

readStdIn :: IO [Int]
readStdIn = do x <- getLine
               let newEntriesRaw = words x
               let newEntries = map read newEntriesRaw
               return newEntries

-- step Defintion
step :: State -> IO State

-- EIf definition
step (EIf cond stmt1 stmt2, env, kont, streams) = step(cond, env, IfK stmt1 stmt2: kont, streams)
step (EBool True, env, IfK stmt1 stmt2: kont, streams) = step(stmt1, env, kont, streams)
step (EBool False, env, IfK stmt1 stmt2: kont, streams) = step(stmt2, env, kont, streams)

-- EWhile definition
step (EWhile cond exp, env, kont, streams) = step(cond, env, WhileK exp: kont, streams)
step (EBool True, env, WhileK exp: kont, streams) = step(exp, env, kont, streams)
step (EBool False, env, WhileK exp: kont, streams) = step(EBool False, env, kont, streams)

-- EAssignment definition
step (EAssignment var exp, env, kont, streams) = step(exp, env, AssignmentK var: kont, streams)
step (EInt a, env, AssignmentK var:kont, streams) = step((EInt a), (var, EInt a):env, kont, streams)
step (EBool b, env, AssignmentK var:kont, streams) = step((EBool b), (var, EBool b):env, kont, streams)

-- Var lookup definition
step (Var exp, env, kont, streams) = case lookup exp env of
                            Just (EInt a) -> step(EInt a, env, kont, streams)
                            Just (EBool b) -> step(EBool b, env, kont, streams)
                            Nothing -> error "Variable not found"

-- Add definition
step (Add exp1 exp2, env, kont, streams) = step (exp1, env, LK HoleL exp2:kont, streams)
step (EInt a, env, LK HoleL exp2:kont, streams) = step (exp2, env, RK (EInt a) HoleR:kont, streams)
step (EInt b, env, RK (EInt a) HoleR:kont, streams) = step (EInt (a + b), env, kont, streams)


-- Minus definition
step (Minus exp1 exp2, env, kont, streams) = step (exp1, env, LK HoleL exp2:kont, streams)
step (EInt a, env, LK HoleL exp2:kont, streams) = step (exp2, env, RK (EInt a) HoleR:kont, streams)
step (EInt b, env, RK (EInt a) HoleR:kont, streams) = step (EInt (a - b), env, kont, streams)


-- Multiply definition
step (Multiply exp1 exp2, env, kont, streams) = step (exp1, env, LK HoleL exp2:kont, streams)
step (EInt a, env, LK HoleL exp2:kont, streams) = step (exp2, env, RK (EInt a) HoleR:kont, streams)
step (EInt b, env, RK (EInt a) HoleR:kont, streams) = step (EInt (a * b), env, kont, streams)


-- Divide definition
step (Divide exp1 exp2, env, kont, streams) = step (exp1, env, LK HoleL exp2:kont, streams)
step (EInt a, env, LK HoleL exp2:kont, streams) = step (exp2, env, RK (EInt a) HoleR:kont, streams)
step (EInt b, env, RK (EInt a) HoleR:kont, streams) = step (EInt (a `div` b), env, kont, streams)


-- Exponential definition
step (Exponential exp1 exp2, env, kont, streams) = step (exp1, env, LK HoleL exp2:kont, streams)
step (EInt a, env, LK HoleL exp2:kont, streams) = step (exp2, env, RK (EInt a) HoleR:kont, streams)
step (EInt b, env, RK (EInt a) HoleR:kont, streams) = step (EInt (a ^ b), env, kont, streams)

-- Negative definition
step (Negative exp1, env, kont, streams) = step (exp1, env, NegativeK exp1:kont, streams)
step (EInt a, env, NegativeK exp1:kont, streams) = step (EInt (-a), env, kont, streams)

-- Equivalent definition
step (Equivalent exp1 exp2, env, kont, streams) = step (exp1, env, LK HoleL exp2:kont, streams)
step (EInt a, env, LK HoleL exp2:kont, streams) = step (exp2, env, RK (EInt a) HoleR:kont, streams)
step (EInt b, env, RK (EInt a) HoleR:kont, streams) = step (EBool (a == b), env, kont, streams)
step (EBool a, env, LK HoleL exp2:kont, streams) = step (exp2, env, RK (EBool a) HoleR:kont, streams)
step (EBool b, env, RK (EBool a) HoleR:kont, streams) = step (EBool (a == b), env, kont, streams)


-- Not definition
step (Not exp1, env, kont, streams) = step (exp1, env, NotK exp1:kont, streams)
step (EBool a, env, NotK exp1:kont, streams) = step (EBool (not a), env, kont, streams)


-- And definition
step (And exp1 exp2, env, kont, streams) = step (exp1, env, LK HoleL exp2:kont, streams)
step (EBool a, env, LK HoleL exp2:kont, streams) = step (exp2, env, RK (EBool a) HoleR:kont, streams)
step (EBool b, env, RK (EBool a) HoleR:kont, streams) = step (EBool (a && b), env, kont, streams)


-- Lesser definition
step (Lesser exp1 exp2, env, kont, streams) = step (exp1, env, LK HoleL exp2:kont, streams)
step (EInt a, env, LK HoleL exp2:kont, streams) = step (exp2, env, RK (EInt a) HoleR:kont, streams)
step (EInt b, env, RK (EInt a) HoleR:kont, streams) = step (EBool (a < b), env, kont, streams)


-- Greater definition
step (Greater exp1 exp2, env, kont, streams) = step (exp1, env, LK HoleL exp2:kont, streams)
step (EInt a, env, LK HoleL exp2:kont, streams) = step (exp2, env, RK (EInt a) HoleR:kont, streams)
step (EInt b, env, RK (EInt a) HoleR:kont, streams) = step (EBool (a > b), env, kont, streams)


-- LesserEqual definition
step (LesserEqual exp1 exp2, env, kont, streams) = step (exp1, env, LK HoleL exp2:kont, streams)
step (EInt a, env, LK HoleL exp2:kont, streams) = step (exp2, env, RK (EInt a) HoleR:kont, streams)
step (EInt b, env, RK (EInt a) HoleR:kont, streams) = step (EBool (a <= b), env, kont, streams)


-- GreaterEqual definition
step (GreaterEqual exp1 exp2, env, kont, streams) = step (exp1, env, LK HoleL exp2:kont, streams)
step (EInt a, env, LK HoleL exp2:kont, streams) = step (exp2, env, RK (EInt a) HoleR:kont, streams)

-- Or definition
step (Or exp1 exp2, env, kont, streams) = step (exp1, env, LK HoleL exp2:kont, streams)
step (EBool a, env, LK HoleL exp2:kont, streams) = step (exp2, env, RK (EBool a) HoleR:kont, streams)
step (EBool b, env, RK (EBool a) HoleR:kont, streams) = step (EBool (a || b), env, kont, streams)

-- Print Expression definition
step (EPrint exp1, env, kont, streams) = step (exp1, env, PrintK exp1:kont, streams)
step (exp1, env, PrintK exp2:kont, streams) | isValue exp1 = do putStrLn $ id $ unwrap exp1
                                                                step (exp1, env, kont, streams)

-- Stream Increment definition
step (EIncS exp1, env, kont, streams) = step(exp1, env, IncSK exp1: kont, streams)
step (EInt a, env, IncSK exp1:kont, streams) = step(EInt a, env, kont, updateStreams(streams))

-- End Expression definition MUST BE AT THE BOTTOM OF THE FILE ABOVE step State = pure state
step (End exp1 exp2, env, kont, streams) = step (exp1, env, EndK exp2:kont, streams)
step (exp1, env, EndK exp2:kont, streams) = step (exp2, env, kont, streams)

-- Lowest level of evaluation for primitives
step state = pure state


--Unwraps pure to value
unwrap (EInt a) = show a
unwrap (EString a) = show a
unwrap (EBool a) = show a


-- Entry poEInt for execution
test exp = step(exp,[],[Done], [])