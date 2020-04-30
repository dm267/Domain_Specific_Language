--C E K
type State = (Exp, Env, Kont)

-- This is information from your parser, notice how we also have data structures in here aswell

data Exp = Add Exp Exp | Int Integer | Boolean Bool | If Exp Exp | Assignment String Exp | Var String | EndExp Exp Exp deriving Show


type Env = [(String,Exp)]
-- Exp -> Add (3) (4)
--        Add (Add 3 4) 4
-- If Cond Exp

type Kont = [Frames]

data Holes = HoleL | HoleR deriving Show
data Frames = Done | AddLK Holes Exp | AddRK Exp Holes | IfK Exp | UnboundVariable String | EndExpK Exp  deriving Show

-- Add (3) (4)

step (Add exp1 exp2, env,kont) = step(exp1,env,AddLK HoleL exp2:kont)

step (Int a,env,AddLK HoleL exp2:kont) = step (exp2, env,AddRK (Int a) HoleR:kont)

step (Int b,env,AddRK (Int a) HoleR:kont) = step(Int (a + b),env,kont)


-- If else statements
step (If cond exp, env, kont) = step(cond,env,IfK exp: kont)
step(Boolean True, env,IfK exp: kont) = step(exp,env,kont)
step(Boolean False, env,IfK exp: kont) = step(Boolean False,env,kont)


-- Assignment
step (Assignment name exp,env,kont) = step(exp,env,UnboundVariable name:kont)
step (Int a,env,UnboundVariable name:kont) = step(Int a,(name,Int a):env,kont)
step (Boolean b,env,UnboundVariable name:kont) = step(Boolean b,(name,Boolean b):env,kont)

-- Lookup
step(Var name,env,kont) = case lookup name env of
                          Just (Int a) -> step(Int a,env,kont)
                          Just (Boolean b) -> step(Boolean b,env,kont)
                          Nothing -> error "REEEEEEEEEEE"

-- Chained expressions
step(EndExp exp1 exp2,env,kont) = step(exp1, env, EndExpK exp2:kont)
step(bruh,env,EndExpK exp2:kont) = step(exp2, env,kont)
step state = state

-- Testing function
test exp = step(exp,[],[Done])