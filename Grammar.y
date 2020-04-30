-- happy <inputfile> -o <outputfile>
--implement unused terminals

{ 
module Grammar where 
import Tokens 
}

%name parseCalc 

%tokentype { Token } 

%error { parseError }

%token 
   digit   { TokenDigit _ $$ } 
   int     { TokenInt _ $$ }
   True    { TokenTrue _ }
   False   { TokenFalse _ }
   If      { TokenIf _ } 
   Then    { TokenThen _ } 
   Else    { TokenElse _ }
   While   { TokenWhile _ }
   Print   { TokenPrint _ } 
--   '='     { TokenEqual _ } --unused terminal
   '=='    { TokenEquivalent _ }
   '!'     { TokenNot _ }
   '&&'    { TokenAnd _ }
   '+'     { TokenAdd _ }
   '-'     { TokenMinus _ }
   '*'     { TokenMultiply _ }
   '/'     { TokenDivision _ }
   '^'     { TokenExponential _ }
   '<'     { TokenLess _ }
   '>'     { TokenGreat _ }
   '<='    { TokenLessEq _ }
   '>='    { TokenGreatEq _ }
   '|'     { TokenOr _ }
--   ';'     { TokenSeq _ } --unused terminal
   '('     { TokenLeftParen _ } 
   ')'     { TokenRightParen _ }
--   '{'     { TokenLeftBrace _ } --unused terminal
--   '}'     { TokenRightBrace _ } --unused terminal
--   '['     { TokenStreamStart _ } --unused terminal
--   ']'     { TokenStreamEnd _ } --unused terminal
--   ZERO    { TokenZero _ ZeroT }


--Associatives, when on same level it means they have same power

%right Then
%right Else 
%right '!'
%right ';'

%nonassoc '<' '>'

%left '<=' '>='
%left '&&' '|'
%left '+' '-' 
%left '*' '/' 
%left '^' '=='
%left NEG
%%

--Production rules for grammar
--startcode :: { String }
--         : ZERO 				{ "0" }

-- Sequence of productions either zero or more elements
--Productions :
--            {- empty -}               { [] }
--            | Productions Production  { $2 : $1 }


Exp2 :
     {- empty -}           { [] }
     | Exp2 Exp1           { $2 : $1 }
     

Exp1 :
     If '(' Exp ')' Then Exp1 Else Exp1     { EIf $3 $6 $8}
     | While '(' Exp1 ')' Then Exp          { EWhile $3 $6}
	 | Print Exp                            { EPrint $2}

Exp :
    int                          { Int $1 } 
    | digit                      { Digit $1 }
    | True                       { Bool True }
    | False                      { Bool False }
    | Exp '==' Exp               { Equivalent $1 $3 }
    | '!' Exp                    { Not $2 }
    | Exp '&&' Exp               { And $1 $3 }
    | '-' Exp %prec NEG          { Negative $2 }
    | Exp '+' Exp                { Add $1 $3 } 
    | Exp '-' Exp                { Minus $1 $3 } 
    | Exp '*' Exp                { Multiply $1 $3 } 
    | Exp '/' Exp                { Divide $1 $3 } 
    | Exp '^' Exp                { Exponential $1 $3 }
    | Exp '<' Exp                { Lesser $1 $3 }
    | Exp '>' Exp                { Greater $1 $3 }
    | Exp '<=' Exp               { LesserEqual $1 $3 }
    | Exp '>=' Exp               { GreaterEqual $1 $3 }
    | Exp '|' Exp                { Or $1 $3 }
    | '(' Exp ')'                { $2 }

{ 

parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data Exp = Int Int
         | Digit Int
         | EBool Bool
         | Equivalent Exp Exp
         | Not Exp
         | And Exp Exp 
         | Negative Exp		 
         | Add Exp Exp 
         | Minus Exp Exp
         | Multiply Exp Exp 
         | Divide Exp Exp 
         | Exponential Exp Exp
         | Lesser Exp Exp
         | Greater Exp Exp
         | LesserEqual Exp Exp
         | GreaterEqual Exp Exp         
         | Or Exp Exp
         deriving (Show,Eq) 
		 
data Exp1 = Int
         | EIf Exp Exp1 Exp1
         | EWhile Exp Exp1
         | EPrint Exp
         deriving (Show,Eq) 

type Environment = [ (String,Expr) ]
		 
} 
