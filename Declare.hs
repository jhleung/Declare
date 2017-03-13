module Declare where
import Base
import Data.Maybe
import Data.List

-- Define the data type for the abstract syntax of expressions, including variable declarations
data Exp = Number     Int
         | Add        Exp Exp
         | Subtract   Exp Exp
         | Multiply   Exp Exp
         | Divide     Exp Exp
         | Variable   String
         | Declare    [(String, Exp)] Exp
   deriving Show

-- An environment is a list of strings and values
type Env = [(String, Int)]

-- Check Duplicates
duplicate :: [String] -> Bool 
duplicate variables = length [v | v <- variables, length (elemIndices v variables) > 1] > 0

-- Evaluate an expression in an environment
evaluate :: Exp -> Env -> Int
evaluate (Number i) env     = i
evaluate (Add a b) env       = evaluate a env + evaluate b env
evaluate (Subtract a b) env  = evaluate a env - evaluate b env
evaluate (Multiply a b) env  = evaluate a env * evaluate b env
evaluate (Divide a b) env    = evaluate a env `div` evaluate b env
evaluate (Variable x) env    = fromJust (lookup x env)
evaluate (Declare pairs body) env = 
	if (duplicate [fst p | p <- pairs]) 
	then error ("Duplicate variables.")
	else
	     evaluate body newEnv
		 where newEnv = [(p1, evaluate p2 env) | (p1, p2) <- pairs] ++ env

-- execute evaluates an expression in an empty environment
execute e = evaluate e []
