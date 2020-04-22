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
   \=      { TokenEqual _ }
   \==     { TokenEquivalent _ }
   \!      { TokenNot _ }
   \&&     { TokenAnd _ }
   \+      { TokenAdd _ }
   \-      { TokenMinus _ }
   \*      { TokenMultiply _ }
   \/      { TokenDivision _ }
   \^      { TokenExponential _ }
   \<      { TokenLess _ }
   \>      { TokenGreat _ }
   \<=     { TokenLessEq _ }
   \>=     { TokenGreatEq _ }
   \|      { TokenOr _ }
   ';'     { TokenSeq _ }
   '('     { TokenLParen _ } 
   ')'     { TokenRParen _ } 


--Associatives 
%right Then
%right Else 
%right ';' 
%left
%%

Exp1 :
     If '(' Exp ')' Then Exp1 Else Exp1     { EIf $3 $6 $8}
     | While '(' Exp ')' then Exp1          { EWhile $3 $6}

Exp : int                        { $2 } 
    | digit                      { $2 }
    | True                       { EBool True }
    | False                      { EBool False }
    | Exp '==' Exp               { Equivalent $1 $3 }
    | '!' Exp                    { Not $2 }
    | Exp '&&' Exp               { And $1 $3 }
    | Exp '+' Exp                { Add $1 $3 } 
    | Exp '-' Exp                { Minus $1 $3 } 
    | Exp '*' Exp                { Multiply $1 $3 } 
    | Exp '/' Exp                { Divide $1 $3 } 
    | Exp '^' Exp                { Exponetial $1 $3 }
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

data Exp = Int
         | Digit
         | EBool Bool
         | Equivalent Exp Exp
         | Not Exp
         | And Exp Exp  
         | Add Exp Exp 
         | Minus Exp Exp
         | Muliply Exp Exp 
         | Divide Exp Exp 
         | Exponetial Exp Exp
         | Lesser Exp Exp
         | Greater Exp Exp
         | LesserEqual Exp Exp
         | GreaterEqual Exp Exp         
         | Or Exp Exp
         deriving Show 
		 
data Exp1 = Int
         | EIf Exp Exp1 Exp1
         | EWhile Exp Exp1
         deriving Show 
		 
		 
} 
