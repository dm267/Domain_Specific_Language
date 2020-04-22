{ 
module Tokens where 
}

--Add stream tokens

%wrapper "posn" 
$digit = 0-9    
--Digits 

$alpha = [a-zA-Z]
--Letters

$eol   = [\n] 
--End of line function

tokens :-

  $eol                          ;
  $white+                       ; 
  "--".*                        ; 
  [1-9]                         { tok (\p s -> TokenDigit p (read s)) } 
  $digit $digit+                { tok (\p s -> TokenInt p (read s)) }
  True                          { tok (\p s -> TokenTrue p) }
  False                         { tok (\p s -> TokenFalse p) } 
  If                            { tok (\p s -> TokenIf p) }
  Then                          { tok (\p s -> TokenThen p) }
  Else                          { tok (\p s -> TokenElse p) }
  While                         { tok (\p s -> TokenWhile p) }
  \=                            { tok (\p s -> TokenEqual p) }
  \==                           { tok (\p s -> TokenEquivalent p) }
  \!                            { tok (\p s -> TokenNot p) }
  \&&                           { tok (\p s -> TokenAnd p) }
  \+                            { tok (\p s -> TokenAdd p) }
  \-                            { tok (\p s -> TokenMinus p) }
  \*                            { tok (\p s -> TokenMultiply p) }
  \/                            { tok (\p s -> TokenDivide p) }
  \^                            { tok (\p s -> TokenExponential p) }
  \<                            { tok (\p s -> TokenLesser p) }
  \>                            { tok (\p s -> TokenGreater p) }
  \<=                           { tok (\p s -> TokenLesserEqual p) }
  \>=                           { tok (\p s -> TokenGreaterEqual p) }
  \|                            { tok (\p s -> TokenOr p) }
  \;                            { tok (\p s -> TokenSeq p )}
  \(                            { tok (\p s -> TokenLParen p) }
  \)                            { tok (\p s -> TokenRParen p) }

{ 
-- Each action has type :: AlexPosn -> String -> Token 

-- Helper function
tok f p s = f p s

-- Token type: 
data Token = 
  TokenDigit AlexPosn Int      |
  TokenInt AlexPosn Int        | 
  TokenTrue AlexPosn           |
  TokenFalse AlexPosn          |
  TokenIf AlexPosn             |
  TokenThen AlexPosn           |
  TokenElse AlexPosn           |
  TokenWhile AlexPosn          |
  TokenEqual AlexPosn          |
  TokenEquivalent AlexPosn     |
  TokenNot AlexPosn            |
  TokenAnd AlexPosn            |
  TokenAdd AlexPosn            |
  TokenMinus AlexPosn          |
  TokenMultiply AlexPosn       |
  TokenDivide AlexPosn         |
  TokenExponential AlexPosn    |
  TokenLesser AlexPosn         |
  TokenGreater AlexPosn        |
  TokenLesserEqual AlexPosn    |
  TokenGreaterEqual AlexPosn   |
  TokenOr AlexPosn             |
  TokenSeq AlexPosn            |
  TokenLParen AlexPosn         |
  TokenRParen AlexPosn      
  deriving (Eq,Show) 

tokenPosn :: Token -> String
tokenPosn (TokenDigit  (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenInt  (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTrue (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFalse (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIf (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenThen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenElse (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenWhile (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEquivalent (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenNot (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAnd (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAdd (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMinus (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMultiply (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDiviide (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenExponential (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLesser (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreater (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLesserEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreaterEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenOr (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSeq (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)


}
