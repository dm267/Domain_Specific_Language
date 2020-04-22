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
    If      { TokenIf _ } 
    Then    { TokenThen _ } 
    Else    { TokenElse _ } 
    ';'     { TokenSeq _ }
    '('     { TokenLParen _ } 
    ')'     { TokenRParen _ } 

%right Then
%right Else 
%right ';' 
%% 
Exp :  int               { $2 } 
    |  digit             { $2 }
    | If Exp Then Exp Else Exp  { Cond $2 $4 $6 } 
    | Exp ';' Exp               { Seq $1 $3 } 
    | '(' Exp ')'                   { $2 }


{ 
parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data Exp = Int
         | Cond Exp Exp Exp
         | Seq Exp Exp 
         deriving Show 
} 
