import Grammar
import Tokens
import CEKMachine
import System.Environment
import Control.Exception
import System.IO

main :: IO ()
main = do (fileName : _ ) <- getArgs
           sourceText <- readFile fileName
           let parsedProg = parseCalc (alexScanTokens sourceText)
           runInput [] parsedProg []


runInput env parsedProg stream =
    do
        done <- isEOF
        if done
            then
                putStr ""
            else
                do s <- getLine
                   let (out, newEnv, newStreams) = evalLoop s env stream parsedProg
                   putStrLn out
                   runInput newEnv parsedProg newStreams


readLines :: Handle -> IO [String]
readLines h = do
  s <- hGetContents h
  return $ lines s
