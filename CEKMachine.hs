module CEKMachine where

import Tokens
import Grammar
import System.IO.Unsafe (unsafePerformIO)

type Env = [(String,Exp)]
type Kont = [Frames]
type State = (Exp, Env, Kont, Streams)

type Streams = [[Int]]

data Holes = HoleL | HoleR deriving Show
data Frames = Done | IfK Exp Exp | WhileLK Exp Exp | WhileRK Exp Exp | AssignmentK String | AddLK Holes Exp | AddRK Exp Holes | NotK Exp
 | NegativeK Exp | EndK Exp | PrintK Exp | IncSK Exp | RedSK Exp | LenK Exp | GetLK Holes Exp
 | GetRK Exp Holes | MinLK Holes Exp | MinRK Exp Holes | MulLK Holes Exp | MulRK Exp Holes | DivLK Holes Exp | DivRK Exp Holes
 | ExponentialLK Holes Exp | ExponentialRK Exp Holes | EquivLK Holes Exp | EquivRK Exp Holes | AndLK Holes Exp | AndRK Exp Holes
 | LessLK Holes Exp | LessRK Exp Holes | GreatLK Holes Exp | GreatRK Exp Holes | LeqLK Holes Exp | LeqRK Exp Holes
 | GeqLK Holes Exp | GeqRK Exp Holes | OrLK Holes Exp | OrRK Exp Holes deriving Show

-- Checks for terminated expressions
isValue :: Exp -> Bool
isValue (EInt _) = True
isValue (EBool _) = True
isValue (EString _) = True
isValue _ = False

runNTimes :: Int -> [[Int]] -> ([[Int]] -> [[Int]]) -> [[Int]]
runNTimes 0 streams f = streams
runNTimes n streams f = runNTimes (n-1) (f(streams)) f

-- Removes the first index from selected stream
tailIndex ix = map (\(i, x) -> if i == ix then tail x else x) . zip [0..]

-- Reads a line from stdin and adds it to existing Streams
updateStreams :: [[Int]] -> [[Int]]
updateStreams streams
    | length streams == 0 = map (\x -> [x]) (unsafePerformIO readStdIn)
    | otherwise = zipWith (\x y -> x ++ [y]) streams (unsafePerformIO readStdIn)

readStdIn :: IO [Int]
readStdIn = do x <- getLine
               let newEntriesRaw = words x
               let newEntries = map read newEntriesRaw
               return newEntries

-- Retrieves the length of a stream
getLength :: Int -> [[Int]] -> Int
getLength n xss = length (xss !! n)



-- step Defintion
step :: State -> IO State

-- EIf definition
step (EIf cond stmt1 stmt2, env, kont, streams) = step(cond, env, IfK stmt1 stmt2: kont, streams)
step (EBool True, env, IfK stmt1 stmt2: kont, streams) = step(stmt1, env, kont, streams)
step (EBool False, env, IfK stmt1 stmt2: kont, streams) = step(stmt2, env, kont, streams)

-- EWhile definition
step (EWhile cond exp1, env, kont, streams) = step(cond, env, WhileLK cond exp1: kont, streams)
step (EBool True, env, WhileLK cond exp1:kont, streams) = step(exp1, env, WhileRK cond exp1: kont, streams)
step (e, env, WhileRK cond exp1:kont, streams) | isValue e = step ((EWhile cond exp1), env, kont, streams)
step (EBool False, env, WhileLK cond exp1:kont, streams) = step(EBool False, env, kont, streams)

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
step (Add exp1 exp2, env, kont, streams) = step (exp1, env, AddLK HoleL exp2:kont, streams)
step (EInt a, env, AddLK HoleL exp2:kont, streams) = step (exp2, env, AddRK (EInt a) HoleR:kont, streams)
step (EInt b, env, AddRK (EInt a) HoleR:kont, streams) = step (EInt (a + b), env, kont, streams)


-- Minus definition
step (Minus exp1 exp2, env, kont, streams) = step (exp1, env, MinLK HoleL exp2:kont, streams)
step (EInt a, env, MinLK HoleL exp2:kont, streams) = step (exp2, env, MinRK (EInt a) HoleR:kont, streams)
step (EInt b, env, MinRK (EInt a) HoleR:kont, streams) = step (EInt (a - b), env, kont, streams)


-- Multiply definition
step (Multiply exp1 exp2, env, kont, streams) = step (exp1, env, MulLK HoleL exp2:kont, streams)
step (EInt a, env, MulLK HoleL exp2:kont, streams) = step (exp2, env, MulRK (EInt a) HoleR:kont, streams)
step (EInt b, env, MulRK (EInt a) HoleR:kont, streams) = step (EInt (a * b), env, kont, streams)


-- Divide definition
step (Divide exp1 exp2, env, kont, streams) = step (exp1, env, DivLK HoleL exp2:kont, streams)
step (EInt a, env, DivLK HoleL exp2:kont, streams) = step (exp2, env, DivRK (EInt a) HoleR:kont, streams)
step (EInt b, env, DivRK (EInt a) HoleR:kont, streams) = step (EInt (a `div` b), env, kont, streams)


-- Exponential definition
step (Exponential exp1 exp2, env, kont, streams) = step (exp1, env, ExponentialLK HoleL exp2:kont, streams)
step (EInt a, env, ExponentialLK HoleL exp2:kont, streams) = step (exp2, env, ExponentialRK (EInt a) HoleR:kont, streams)
step (EInt b, env, ExponentialRK (EInt a) HoleR:kont, streams) = step (EInt (a ^ b), env, kont, streams)

-- Negative definition
step (Negative exp1, env, kont, streams) = step (exp1, env, NegativeK exp1:kont, streams)
step (EInt a, env, NegativeK exp1:kont, streams) = step (EInt (-a), env, kont, streams)

-- Equivalent definition
step (Equivalent exp1 exp2, env, kont, streams) = step (exp1, env, EquivLK HoleL exp2:kont, streams)
step (EInt a, env, EquivLK HoleL exp2:kont, streams) = step (exp2, env, EquivRK (EInt a) HoleR:kont, streams)
step (EInt b, env, EquivRK (EInt a) HoleR:kont, streams) = step (EBool (a == b), env, kont, streams)
step (EBool a, env, EquivLK HoleL exp2:kont, streams) = step (exp2, env, EquivRK (EBool a) HoleR:kont, streams)
step (EBool b, env, EquivRK (EBool a) HoleR:kont, streams) = step (EBool (a == b), env, kont, streams)


-- Not definition
step (Not exp1, env, kont, streams) = step (exp1, env, NotK exp1:kont, streams)
step (EBool a, env, NotK exp1:kont, streams) = step (EBool (not a), env, kont, streams)


-- And definition
step (And exp1 exp2, env, kont, streams) = step (exp1, env, AndLK HoleL exp2:kont, streams)
step (EBool a, env, AndLK HoleL exp2:kont, streams) = step (exp2, env, AndRK (EBool a) HoleR:kont, streams)
step (EBool b, env, AndRK (EBool a) HoleR:kont, streams) = step (EBool (a && b), env, kont, streams)


-- Lesser definition
step (Lesser exp1 exp2, env, kont, streams) = step (exp1, env, LessLK HoleL exp2:kont, streams)
step (EInt a, env, LessLK HoleL exp2:kont, streams) = step (exp2, env, LessRK (EInt a) HoleR:kont, streams)
step (EInt b, env, LessRK (EInt a) HoleR:kont, streams) = step (EBool (a < b), env, kont, streams)


-- Greater definition
step (Greater exp1 exp2, env, kont, streams) = step (exp1, env, GreatLK HoleL exp2:kont, streams)
step (EInt a, env, GreatLK HoleL exp2:kont, streams) = step (exp2, env, GreatRK (EInt a) HoleR:kont, streams)
step (EInt b, env, GreatRK (EInt a) HoleR:kont, streams) = step (EBool (a > b), env, kont, streams)


-- LesserEqual definition
step (LesserEqual exp1 exp2, env, kont, streams) = step (exp1, env, LeqLK HoleL exp2:kont, streams)
step (EInt a, env, LeqLK HoleL exp2:kont, streams) = step (exp2, env, LeqRK (EInt a) HoleR:kont, streams)
step (EInt b, env, LeqRK (EInt a) HoleR:kont, streams) = step (EBool (a <= b), env, kont, streams)


-- GreaterEqual definition
step (GreaterEqual exp1 exp2, env, kont, streams) = step (exp1, env, GeqLK HoleL exp2:kont, streams)
step (EInt a, env, GeqLK HoleL exp2:kont, streams) = step (exp2, env, GeqRK (EInt a) HoleR:kont, streams)
step (EInt b, env, GeqRK (EInt a) HoleR:kont, streams) = step (EBool (a >= b), env, kont, streams)

-- Or definition
step (Or exp1 exp2, env, kont, streams) = step (exp1, env, OrLK HoleL exp2:kont, streams)
step (EBool a, env, OrLK HoleL exp2:kont, streams) = step (exp2, env, OrRK (EBool a) HoleR:kont, streams)
step (EBool b, env, OrRK (EBool a) HoleR:kont, streams) = step (EBool (a || b), env, kont, streams)

-- Print Expression definition
step (EPrint exp1, env, kont, streams) = step (exp1, env, PrintK exp1:kont, streams)
step (exp1, env, PrintK exp2:kont, streams) | isValue exp1 = do putStrLn $ id $ unwrap exp1
                                                                step (exp1, env, kont, streams)

-- Stream Increment definition
step (EIncS exp1, env, kont, streams) = step(exp1, env, IncSK exp1: kont, streams)
step (EInt a, env, IncSK exp1:kont, streams) = step(EInt a, env, kont, runNTimes a streams updateStreams)

-- Stream Reduce Definition
step (ERedS exp1, env, kont, streams) = step(exp1, env, RedSK exp1: kont, streams)
step (EInt a, env, RedSK exp1:kont, streams) = step(EInt a, env, kont, tailIndex a streams)

-- Stream Get Definition
step (EGetS exp1 exp2, env, kont, streams) = step(exp1, env, GetLK HoleL exp2: kont, streams)
step (EInt a, env, GetLK HoleL exp2:kont, streams) = step(exp2, env, GetRK (EInt a) HoleR:kont, streams)
step (EInt b, env, GetRK (EInt a) HoleR:kont, streams) = step(EInt (streams !! a !! b), env, kont, streams)

-- Length Definition
step (ELenS exp1, env, kont, streams) = step(exp1, env, LenK exp1: kont, streams)
step (EInt a, env, LenK exp1:kont, streams) = step(EInt (getLength a streams), env, kont, streams)

-- End Expression definition MUST BE AT THE BOTTOM OF THE FILE ABOVE step State = pure state
step (End exp1 exp2, env, kont, streams) = step (exp1, env, EndK exp2:kont, streams)
step (exp1, env, EndK exp2:kont, streams) = step (exp2, env, kont, streams)

-- Lowest level of evaluation for primitives
step state = return state

-- Function to iterate the small step reduction to termination
evalProg exp = (\(a,_,_,_) -> a) (unsafePerformIO (step(exp, [], [Done], [])))

--Unwraps pure to value
unwrap (EInt a) = show a
unwrap (EString a) = show a
unwrap (EBool a) = show a


-- Entry poEInt for execution
test exp = step(exp,[],[Done], [])