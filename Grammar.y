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
   int     { TokenInt _ $$ }
   var     { TokenVar _ $$ }
   True    { TokenTrue _ }
   False   { TokenFalse _ }
   If      { TokenIf _ } 
   Then    { TokenThen _ } 
   Else    { TokenElse _ }
   While   { TokenWhile _ }
   Print   { TokenPrint _ } 
   '='     { TokenEqual _ }
   '=='    { TokenEquivalent _ }
   '!'     { TokenNot _ }
   '&&'    { TokenAnd _ }
   '+'     { TokenAdd _ }
   '-'     { TokenMinus _ }
   '*'     { TokenMultiply _ }
   '/'     { TokenDivide _ }
   '^'     { TokenExponential _ }
   '<'     { TokenLesser _ }
   '>'     { TokenGreater _ }
   '<='    { TokenLesserEqual _ }
   '>='    { TokenGreaterEqual  _ }
   '|'     { TokenOr _ }
   ';'     { TokenEndExp _ }
   '('     { TokenLeftParen _ } 
   ')'     { TokenRightParen _ }


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


Exp :
    int                                      { EInt $1 }
    | True                                   { EBool True }
    | False                                  { EBool False }
    | Exp '==' Exp                           { Equivalent $1 $3 }
    | '!' Exp                                { Not $2 }
    | Exp '&&' Exp                           { And $1 $3 }
    | '-' Exp %prec NEG                      { Negative $2 }
    | Exp '+' Exp                            { Add $1 $3 } 
    | Exp '-' Exp                            { Minus $1 $3 } 
    | Exp '*' Exp                            { Multiply $1 $3 } 
    | Exp '/' Exp                            { Divide $1 $3 } 
    | Exp '^' Exp                            { Exponential $1 $3 }
    | Exp '<' Exp                            { Lesser $1 $3 }
    | Exp '>' Exp                            { Greater $1 $3 }
    | Exp '<=' Exp                           { LesserEqual $1 $3 }
    | Exp '>=' Exp                           { GreaterEqual $1 $3 }
    | Exp '|' Exp                            { Or $1 $3 }
    | If '(' Exp ')' Then Exp Else Exp       { EIf $3 $6 $8}
    | Print Exp                              { EPrint $2}
    | While '(' Exp ')' Then Exp             { EWhile $3 $6}
    | incrementStream Exp                    { EIncS $2}
    | reduceStream Exp                       { ERedS $2}
    | getStream Exp                          { EGetS $2}
    | Length Exp                             { ELen $2}
    | Exp !!' Exp                            { EIndex $1 $3}
    | Exp ';' Exp                            { End $1 $3}
    | var '=' Exp                            { EAssignment $1 $3}
    | '(' Exp ')'                            { $2 }

{ 

parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error" 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))


data Exp = EInt Int
         | EString String
         | Var String
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
         | EIf Exp Exp Exp
         | EPrint Exp
         | EWhile Exp Exp
         | EIncS Exp
         | ERedS Exp
         | EGetS Exp
         | ELen Exp
         | EIndex Exp Exp
         | End Exp Exp
         | EAssignment String Exp
         deriving (Show,Eq)

}
