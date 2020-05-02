-- alex <inputfile> -o <outputfile>

{ 
module Tokens where 
}

--Add stream tokens

%wrapper "posn" 

--Digits
$digit = 0-9    

--Letters
$lower    = a-z
$upper    = A-Z
$alpha    = [$upper $lower]

--End of line function
$eol   = [\n] 

--Comments?
--@comment = "--".*
--@ws      = $white+ | @comment

tokens :-

--@ws                             { skip }     -- white space; ignore

  $eol                          ;
  $white+                       ; 
  "--".*                        ; 
  $digit+                       { tok (\p s -> TokenInt p (read s)) } --one or more including 0
  $alpha [$alpha $digit]*       { tok (\p s -> TokenVar p s) }
  True                          { tok (\p s -> TokenTrue p) }
  False                         { tok (\p s -> TokenFalse p) } 
  If                            { tok (\p s -> TokenIf p) }
  Then                          { tok (\p s -> TokenThen p) }
  Else                          { tok (\p s -> TokenElse p) }
  While                         { tok (\p s -> TokenWhile p) }
  Print                         { tok (\p s -> TokenPrint p) }
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
  \(                            { tok (\p s -> TokenLeftParen p) }
  \)                            { tok (\p s -> TokenRightParen p) }
  \{                            { tok (\p s -> TokenLeftBrace p) }
  \}                            { tok (\p s -> TokenRightBrace p) }
  \[                            { tok (\p s -> TokenStreamStart p) }
  \]                            { tok (\p s -> TokenStreamEnd p) }

{ 
-- Each action has type :: AlexPosn -> String -> Token 
-- Helper Function
tok f p s = f p s


-- Each action has type :: String -> Token
-- Token Type: 
data Token = 
  TokenInt AlexPosn Int        |
  TokenVar AlexPosn String     | 
  TokenTrue AlexPosn           |
  TokenFalse AlexPosn          |
  TokenIf AlexPosn             |
  TokenThen AlexPosn           |
  TokenElse AlexPosn           |
  TokenWhile AlexPosn          |
  TokenPrint AlexPosn          |
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
  TokenLeftParen AlexPosn      |
  TokenRightParen AlexPosn     |
  TokenLeftBrace AlexPosn      |
  TokenRightBrace AlexPosn     |
  TokenStreamStart AlexPosn    |
  TokenStreamEnd AlexPosn
  deriving (Eq,Show) 


--Token Functions
tokenPosn :: Token -> String
tokenPosn (TokenInt (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenVar (AlexPn a l c) _) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTrue (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFalse (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIf (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenThen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenElse (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenWhile (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPrint (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEquivalent (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenNot (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAnd (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAdd (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMinus (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMultiply (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDivide (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenExponential (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLesser (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreater (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLesserEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGreaterEqual (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenOr (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLeftParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRightParen (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLeftBrace (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRightBrace (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenStreamStart (AlexPn a l c)) = show(l) ++ ":" ++ show(c)
tokenPosn (TokenStreamEnd (AlexPn a l c)) = show(l) ++ ":" ++ show(c)

--skip :: Action
--skip _ _ = lexToken

}