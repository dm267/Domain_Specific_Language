import Tokens
import Grammar
import CEKMachine
import System.Environment
import Control.Exception
import System.IO

main :: IO ()
main = main'

main' = do (fileName : _ ) <- getArgs
           sourceText <- readFile fileName
           let parsedProg = parseCalc (alexScanTokens sourceText)
           let result = evalProg (parsedProg)